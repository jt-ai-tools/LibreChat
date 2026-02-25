# @librechat/client 動態主題系統 (Dynamic Theme System)

此主題系統允許您使用 CSS 變數與 Tailwind CSS 動態更改 React 應用程式中的顏色。它結合了深色/淺色模式切換與動態顏色主題化功能。

## 目錄
- [概覽](#概覽)
- [運作原理](#運作原理)
- [基本用法](#基本用法)
- [可用主題顏色](#可用主題顏色)
- [建立自定義主題](#建立自定義主題)
- [環境變數主題](#環境變數主題)
- [深色/淺色模式](#深色淺色模式)
- [遷移指南](#遷移指南)
- [實作細節](#實作細節)
- [疑難排解](#疑難排解)

## 概覽

主題系統提供：
1. **深色/淺色模式切換** - 根據使用者偏好自動切換主題。
2. **動態顏色主題化** - 在執行期間更改顏色，無需重新編譯 CSS。
3. **基於 CSS 變數** - 使用 CSS 自定義屬性以提升效能。
4. **Tailwind 整合** - 與 Tailwind CSS 公用類別無縫搭配。
5. **TypeScript 支援** - 為主題定義提供完整的類型安全。

## 運作原理

主題系統分為三層運作：

1. **CSS 變數層**：在應用程式 CSS 中定義的預設顏色。
2. **ThemeProvider 層**：管理主題狀態並應用 CSS 變數的 React Context。
3. **Tailwind 層**：將 CSS 變數映射到 Tailwind 公用類別。

### 預設行為 (無自定義主題)
- CSS 變數從應用程式的 `style.css` 定義中級聯 (Cascade)。
- 淺色模式使用 `html` 選擇器下的變數。
- 深色模式使用 `.dark` 選擇器下的變數。
- 顏色數值無需 JavaScript 介入。

### 自定義主題行為
- 僅在提供 `themeRGB` 屬性時應用。
- 使用 `rgb()` 格式的數值覆蓋 CSS 變數。
- 保持與現有 CSS 的相容性。

## 基本用法

### 1. 安裝組件庫

```bash
npm install @librechat/client
```

### 2. 使用 ThemeProvider 包裹您的應用程式

```tsx
import { ThemeProvider } from '@librechat/client';

function App() {
  return (
    <ThemeProvider initialTheme="system">
      <YourApp />
    </ThemeProvider>
  );
}
```

### 3. 設置基礎 CSS

確保您的應用程式已定義 CSS 變數作為回退方案：

```css
/* style.css */
:root {
  --white: #fff;
  --gray-800: #212121;
  --gray-100: #ececec;
  /* ... 其他顏色定義 */
}

html {
  --text-primary: var(--gray-800);
  --surface-primary: var(--white);
  /* ... 其他主題變數 */
}

.dark {
  --text-primary: var(--gray-100);
  --surface-primary: var(--gray-900);
  /* ... 其他深色主題變數 */
}
```

### 4. 配置 Tailwind

更新您的 `tailwind.config.js`：

```js
module.exports = {
  content: [
    './src/**/*.{js,jsx,ts,tsx}',
    // 包含組件庫檔案
    './node_modules/@librechat/client/dist/**/*.js',
  ],
  darkMode: ['class'],
  theme: {
    extend: {
      colors: {
        // 將 CSS 變數映射到 Tailwind 顏色
        'text-primary': 'var(--text-primary)',
        'surface-primary': 'var(--surface-primary)',
        'brand-purple': 'var(--brand-purple)',
        // ... 其他顏色
      },
    },
  },
};
```

### 5. 在組件中使用主題顏色

```tsx
function MyComponent() {
  return (
    <div className="bg-surface-primary text-text-primary border border-border-light">
      <h1 className="text-text-secondary">Hello World</h1>
      <button className="bg-surface-submit hover:bg-surface-submit-hover text-white">
        Submit
      </button>
    </div>
  );
}
```

## 可用主題顏色

### 文字顏色 (Text Colors)
- `text-text-primary` - 主要文字顏色
- `text-text-secondary` - 次要文字顏色
- `text-text-secondary-alt` - 替代次要文字
- `text-text-tertiary` - 三級文字顏色
- `text-text-warning` - 警告文字顏色

### 表面顏色 (Surface Colors)
- `bg-surface-primary` - 主要背景
- `bg-surface-secondary` - 次要背景
- `bg-surface-tertiary` - 三級背景
- `bg-surface-submit` - 提交按鈕背景
- `bg-surface-destructive` - 破壞性動作背景
- `bg-surface-dialog` - 對話框/模態視窗背景
- `bg-surface-chat` - 聊天介面背景

### 邊框顏色 (Border Colors)
- `border-border-light` - 淺色邊框
- `border-border-medium` - 中等邊框
- `border-border-heavy` - 重色邊框
- `border-border-xheavy` - 極重色邊框

### 其他顏色
- `bg-brand-purple` - 品牌紫色
- `bg-presentation` - 簡報背景
- `ring-ring-primary` - 焦點環顏色

## 建立自定義主題

### 1. 定義您的主題

```tsx
import { IThemeRGB } from '@librechat/client';

export const customTheme: IThemeRGB = {
  'rgb-text-primary': '0 0 0',        // 黑色
  'rgb-text-secondary': '100 100 100', // 灰色
  'rgb-surface-primary': '255 255 255', // 白色
  'rgb-surface-submit': '0 128 0',     // 綠色
  'rgb-brand-purple': '138 43 226',    // 藍紫色
  // ... 定義其他顏色
};
```

### 2. 使用您的自定義主題

```tsx
import { ThemeProvider } from '@librechat/client';
import { customTheme } from './themes/custom';

function App() {
  return (
    <ThemeProvider themeRGB={customTheme} themeName="custom">
      <YourApp />
    </ThemeProvider>
  );
}
```

## 環境變數主題

從環境變數載入主題顏色：

### 1. 建立環境變數

```env
# .env.local
REACT_APP_THEME_BRAND_PURPLE=171 104 255
REACT_APP_THEME_TEXT_PRIMARY=33 33 33
REACT_APP_THEME_TEXT_SECONDARY=66 66 66
REACT_APP_THEME_SURFACE_PRIMARY=255 255 255
REACT_APP_THEME_SURFACE_SUBMIT=4 120 87
```

### 2. 建立主題載入器

```tsx
function getThemeFromEnv(): IThemeRGB | undefined {
  // 檢查是否設置了任何主題環境變數
  const hasThemeEnvVars = Object.keys(process.env).some(key => 
    key.startsWith('REACT_APP_THEME_')
  );

  if (!hasThemeEnvVars) {
    return undefined; // 使用預設主題
  }

  return {
    'rgb-text-primary': process.env.REACT_APP_THEME_TEXT_PRIMARY || '33 33 33',
    'rgb-brand-purple': process.env.REACT_APP_THEME_BRAND_PURPLE || '171 104 255',
    // ... 其他顏色
  };
}
```

### 3. 應用環境主題

```tsx
<ThemeProvider 
  initialTheme="system"
  themeRGB={getThemeFromEnv()}
>
  <App />
</ThemeProvider>
```

## 深色/淺色模式

ThemeProvider 會自動處理深色/淺色模式：

### 使用主題 Hook

```tsx
import { useTheme } from '@librechat/client';

function ThemeToggle() {
  const { theme, setTheme } = useTheme();
  
  return (
    <button onClick={() => setTheme(theme === 'dark' ? 'light' : 'dark')}>
      當前主題: {theme}
    </button>
  );
}
```

### 主題選項
- `'light'` - 強制淺色模式
- `'dark'` - 強制深色模式
- `'system'` - 遵循系統偏好

## 遷移指南

如果您正從舊版主題系統遷移：

### 1. 更新導入

**之前：**
```tsx
import { ThemeContext, ThemeProvider } from '~/hooks/ThemeContext';
```

**之後：**
```tsx
import { ThemeContext, ThemeProvider } from '@librechat/client';
```

### 2. 更新 ThemeProvider 用法

新的 ThemeProvider 向後相容，但增加了新功能：

```tsx
<ThemeProvider 
  initialTheme="system"  // 與之前相同
  themeRGB={customTheme} // 新增：可選的自定義顏色
>
  <App />
</ThemeProvider>
```

### 3. 現有組件

使用 ThemeContext 的組件無需更改即可繼續運作：

```tsx
// 這仍然有效！
const { theme, setTheme } = useContext(ThemeContext);
```

## 實作細節

### 檔案結構
```
packages/client/src/theme/
├── context/
│   └── ThemeProvider.tsx    # 主要主題提供者
├── types/
│   └── index.ts            # TypeScript 介面
├── themes/
│   ├── default.ts          # 淺色主題顏色
│   ├── dark.ts             # 深色主題顏色
│   └── index.ts            # 主題導出
├── utils/
│   ├── applyTheme.ts       # 應用 CSS 變數
│   ├── tailwindConfig.ts   # Tailwind 輔助工具
│   └── createTailwindColors.js
├── README.md               # 此文件
└── index.ts               # 主要導出
```

### CSS 變數格式

主題系統在 CSS 變數中使用 RGB 數值：
- CSS 變數：`--text-primary: rgb(33 33 33)`
- 主題定義：`'rgb-text-primary': '33 33 33'`
- Tailwind 用法：`text-text-primary`

### RGB 格式要求

所有顏色數值必須使用空格分隔的 RGB 格式：
- ✅ 正確：`'255 255 255'`
- ❌ 錯誤：`'#ffffff'` 或 `'rgb(255, 255, 255)'`

此格式允許 Tailwind 應用不透明度修飾符，例如 `bg-surface-primary/50`。

## 疑難排解

### 常見問題

#### 1. 顏色未應用
- **問題**：自定義主題顏色未顯示。
- **解決方案**：確保您已將 `themeRGB` 屬性傳遞給 ThemeProvider。
- **檢查**：DevTools 中的 CSS 變數應顯示 `rgb(R G B)` 格式。

#### 2. 循環引用錯誤
- **問題**：`--brand-purple: var(--brand-purple)` 建立無限迴圈。
- **解決方案**：直接使用顏色數值：`--brand-purple: #ab68ff`。

#### 3. 深色模式無效
- **問題**：深色模式無法切換。
- **解決方案**：確保 `darkMode: ['class']` 已包含在您的 Tailwind 配置中。
- **檢查**：在深色模式下，`<html>` 元素應具有 `class="dark"`。

#### 4. TypeScript 錯誤
- **問題**：定義主題時出現類型錯誤。
- **解決方案**：導入並使用 `IThemeRGB` 介面：
```tsx
import { IThemeRGB } from '@librechat/client';
```

### 偵錯技巧

1. **檢查 CSS 變數**：使用瀏覽器 DevTools 檢查計算後的 CSS 變數。
2. **驗證主題應用**：在根元素上尋找行內樣式 (Inline styles)。
3. **主控台錯誤**：檢查主控台是否有驗證錯誤。
4. **測試隔離**：嘗試使用極簡主題以隔離問題。

## 範例

### 動態主題切換

```tsx
import { ThemeProvider, defaultTheme, darkTheme } from '@librechat/client';
import { useState } from 'react';

function App() {
  const [isDark, setIsDark] = useState(false);
  
  return (
    <ThemeProvider 
      initialTheme={isDark ? 'dark' : 'light'}
      themeRGB={isDark ? darkTheme : defaultTheme}
      themeName={isDark ? 'dark' : 'default'}
    >
      <button onClick={() => setIsDark(!isDark)}>
        切換主題
      </button>
      <YourApp />
    </ThemeProvider>
  );
}
```

### 多主題選擇器

```tsx
const themes = {
  default: undefined, // 使用 CSS 預設值
  ocean: {
    'rgb-brand-purple': '0 119 190',
    'rgb-surface-primary': '240 248 255',
    // ... 海洋主題顏色
  },
  forest: {
    'rgb-brand-purple': '34 139 34',
    'rgb-surface-primary': '245 255 250',
    // ... 森林主題顏色
  },
};

function App() {
  const [selectedTheme, setSelectedTheme] = useState('default');
  
  return (
    <ThemeProvider 
      themeRGB={themes[selectedTheme]}
      themeName={selectedTheme}
    >
      <select onChange={(e) => setSelectedTheme(e.target.value)}>
        {Object.keys(themes).map(name => (
          <option key={name} value={name}>{name}</option>
        ))}
      </select>
      <YourApp />
    </ThemeProvider>
  );
}
```

### 與主應用程式配合使用

在主應用程式中使用具備 localStorage 持久化功能的 ThemeProvider 時：

```tsx
import { ThemeProvider } from '@librechat/client';
import { getThemeFromEnv } from './utils';

function App() {
  const envTheme = getThemeFromEnv();
  
  return (
    <ThemeProvider 
      // 僅在您希望覆蓋儲存的值時才傳遞屬性
      // 如果您始終傳遞屬性，它們將覆蓋 localStorage
      initialTheme={envTheme ? "system" : undefined}
      themeRGB={envTheme || undefined}
    >
      {/* 您的應用程式內容 */}
    </ThemeProvider>
  );
}
```

**重要提示**：在初始掛載 (Initial mount) 時，傳遞給 ThemeProvider 的屬性將覆蓋儲存的值。僅在您明確希望覆蓋使用者儲存的偏好設置時才傳遞屬性。

## 貢獻

新增主題顏色時：

1. 在 `types/index.ts` 中新增類型定義。
2. 將顏色新增至預設與深色主題。
3. 更新 applyTheme 映射。
4. 新增至 Tailwind 配置。
5. 在此 README 中進行記錄。

## 授權

此主題系統是 @librechat/client 套件的一部分。
