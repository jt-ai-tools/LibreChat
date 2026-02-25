# LibreChat 本地化指南 (Localization Guide)

本指南說明如何為 LibreChat 的本地化系統新增語言。

## 新增語言

要為 LibreChat 新增語言，請按照以下步驟操作：

### 1. 將語言新增至 Locize 專案

- 前往 [LibreChat locize 專案](https://www.locize.app/cat/62uyy7c9)，
- 點擊 "ADD LANGUAGE" 按鈕，通常位於專案概覽頁面 "Start to translate" 卡片的 "..." 選單中。

### 2. 更新語言選擇組件

編輯 `client/src/components/Nav/SettingsTabs/General/General.tsx` 並將新語言選項新增至 `languageOptions` 陣列中：

```typescript
{ value: 'language-code', label: localize('com_nav_lang_language_name') },
```

範例：
```typescript
{ value: 'bo', label: localize('com_nav_lang_tibetan') },
{ value: 'uk-UA', label: localize('com_nav_lang_ukrainian') },
```

**注意：** 使用適當的語言代碼格式：
- 對於沒有區域變體的語言，使用簡單代碼 (例如：`bo`)。
- 根據需要使用特定區域代碼 (例如：`uk-UA`)。

### 3. 新增本地化鍵值 (Localization Keys)

在 `client/src/locales/en/translation.json` 中，為您的語言標籤新增對應的本地化鍵值：

```json
"com_nav_lang_language_name": "原生語言名稱",
```

範例：
```json
"com_nav_lang_tibetan": "བོད་སྐད་",
"com_nav_lang_ukrainian": "Українська",
```

**最佳實踐：** 使用原生語言名稱作為數值。

### 4. 建立翻譯檔案

建立新的目錄與翻譯檔案：

```bash
mkdir -p client/src/locales/[language-code]
```

建立 `client/src/locales/[language-code]/translation.json` 並包含一個空的 JSON 物件：

```json
{
}
```

範例：
- `client/src/locales/bo/translation.json`
- `client/src/locales/uk/translation.json`

### 5. 配置 i18n

更新 `client/src/locales/i18n.ts`：

1. 導入新翻譯檔案：
```typescript
import translationLanguageCode from './language-code/translation.json';
```

2. 將其新增至 `resources` 物件中：
```typescript
export const resources = {
  // ... 現有語言
  'language-code': { translation: translationLanguageCode },
} as const;
```

範例：
```typescript
import translationBo from './bo/translation.json';
import translationUk from './uk/translation.json';

export const resources = {
  // ... 現有語言
  bo: { translation: translationBo },
  uk: { translation: translationUk },
} as const;
```

### 6. 處理回退語言 (Fallback Languages，選填)

如果您的語言在翻譯缺失時應回退到特定語言，請更新 `i18n.ts` 中的 `fallbackLng` 配置：

```typescript
fallbackLng: {
  'language-variant': ['fallback-language', 'en'],
  // ... 現有回退語言
},
```

## 翻譯流程

新增語言後：

1. 空的翻譯檔案將透過 LibreChat 的自動翻譯平台進行填充。
2. 僅有英文 (`en`) 翻譯檔案應手動更新。
3. 其他語言翻譯由外部管理。

## 語言代碼標準

- 大多數語言使用 ISO 639-1 代碼 (例如：`en`, `fr`, `de`)。
- 根據需要使用 ISO 639-1 搭配區域代碼 (例如：`pt-BR`, `zh-Hans`)。
- 藏語使用 `bo` (Bodic)。
- 烏克蘭語使用 `uk` 或 `uk-UA` 搭配區域。

## 測試

新增語言後：

1. 重新啟動開發伺服器。
2. 前往 Settings > General。
3. 確認您的語言出現在下拉選單中。
4. 選擇該語言以確保它更改了 UI 的語言代碼。

## 注意事項

- 將語言選項在下拉選單中依字母順序排列，以獲得更好的 UX。
- 在下拉選單中，語言名稱請始終使用原生文字。
- 對於任何缺失的翻譯，系統將使用英文作為回退。
