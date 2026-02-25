# LibreChat 資料綱要套件 (Data Schemas Package)

此套件使用 Mongoose ODM 為 LibreChat 提供資料庫綱要 (Schemas)、模型 (Models)、類型 (Types) 與方法 (Methods)。

## 📁 套件結構

```
packages/data-schemas/
├── src/
│   ├── schema/         # Mongoose 綱要定義
│   ├── models/         # 模型工廠函數
│   ├── types/          # TypeScript 類型定義
│   ├── methods/        # 資料庫操作方法
│   ├── common/         # 共享常數與列舉 (Enums)
│   ├── config/         # 配置檔案 (winston 等)
│   └── index.ts        # 主套件導出
```

## 🏗️ 架構模式 (Architecture Patterns)

### 1. 綱要檔案 (`src/schema/`)

綱要檔案定義 Mongoose 綱要結構。遵循以下慣例：

- **命名**：使用小寫檔名 (例如：`user.ts`, `accessRole.ts`)。
- **導入**：從 `~/types` 導入類型以獲取 TypeScript 支援。
- **導出**：僅導出綱要作為預設導出 (Default export)。

**範例：**
```typescript
import { Schema } from 'mongoose';
import type { IUser } from '~/types';

const userSchema = new Schema<IUser>(
  {
    name: { type: String },
    email: { type: String, required: true },
    // ... 其他欄位
  },
  { timestamps: true }
);

export default userSchema;
```

### 2. 類型定義 (`src/types/`)

類型檔案定義 TypeScript 介面與類型。遵循以下慣例：

- **基礎類型 (Base Type)**：定義不含 Mongoose Document 屬性的純類型。
- **文件介面 (Document Interface)**：擴展基礎類型，包含 Document 與 `_id`。
- **列舉/常數**：將相關列舉放在類型檔案中，若為共享則放在 `common/`。

**範例：**
```typescript
import type { Document, Types } from 'mongoose';

export type User = {
  name?: string;
  email: string;
  // ... 其他欄位
};

export type IUser = User &
  Document & {
    _id: Types.ObjectId;
  };
```

### 3. 模型工廠函數 (`src/models/`)

模型檔案使用工廠函數建立 Mongoose 模型。遵循以下慣例：

- **函數名稱**：`create[EntityName]Model`。
- **單例模式 (Singleton Pattern)**：建立前檢查模型是否已存在。
- **類型安全**：使用來自 types 的對應介面。

**範例：**
```typescript
import userSchema from '~/schema/user';
import type * as t from '~/types';

export function createUserModel(mongoose: typeof import('mongoose')) {
  return mongoose.models.User || mongoose.model<t.IUser>('User', userSchema);
}
```

### 4. 資料庫方法 (`src/methods/`)

方法檔案包含每個實體 (Entity) 的資料庫操作。遵循以下慣例：

- **函數名稱**：`create[EntityName]Methods`。
- **返回類型**：導出一個用於方法物件的類型。
- **操作**：包含 CRUD 操作與實體特定的查詢。

**範例：**
```typescript
import type { Model } from 'mongoose';
import type { IUser } from '~/types';

export function createUserMethods(mongoose: typeof import('mongoose')) {
  async function findUserById(userId: string): Promise<IUser | null> {
    const User = mongoose.models.User as Model<IUser>;
    return await User.findById(userId).lean();
  }

  async function createUser(userData: Partial<IUser>): Promise<IUser> {
    const User = mongoose.models.User as Model<IUser>;
    return await User.create(userData);
  }

  return {
    findUserById,
    createUser,
    // ... 其他方法
  };
}

export type UserMethods = ReturnType<typeof createUserMethods>;
```

### 5. 主導出 (`src/index.ts`)

主要 index 檔案導出：
- `createModels()` - 所有模型的工廠函數。
- `createMethods()` - 所有方法的工廠函數。
- 來自 `~/types` 的類型導出。
- 共享公用程式與常數。

## 🚀 新增實體

要將新實體新增至 data-schemas 套件，請按照以下步驟操作：

### 步驟 1：建立類型定義

建立 `src/types/[entityName].ts`：

```typescript
import type { Document, Types } from 'mongoose';

export type EntityName = {
  /** 欄位描述 */
  fieldName: string;
  // ... 其他欄位
};

export type IEntityName = EntityName &
  Document & {
    _id: Types.ObjectId;
  };
```

### 步驟 2：更新類型索引 (Types Index)

新增至 `src/types/index.ts`：

```typescript
export * from './entityName';
```

### 步驟 3：建立綱要 (Schema)

建立 `src/schema/[entityName].ts`：

```typescript
import { Schema } from 'mongoose';
import type { IEntityName } from '~/types';

const entityNameSchema = new Schema<IEntityName>(
  {
    fieldName: { type: String, required: true },
    // ... 其他欄位
  },
  { timestamps: true }
);

export default entityNameSchema;
```

### 步驟 4：建立模型工廠

建立 `src/models/[entityName].ts`：

```typescript
import entityNameSchema from '~/schema/entityName';
import type * as t from '~/types';

export function createEntityNameModel(mongoose: typeof import('mongoose')) {
  return (
    mongoose.models.EntityName || 
    mongoose.model<t.IEntityName>('EntityName', entityNameSchema)
  );
}
```

### 步驟 5：更新模型索引 (Models Index)

新增至 `src/models/index.ts`：

1. 導入工廠函數：
```typescript
import { createEntityNameModel } from './entityName';
```

2. 將其新增至 `createModels()` 的返回物件中：
```typescript
EntityName: createEntityNameModel(mongoose),
```

### 步驟 6：建立資料庫方法

建立 `src/methods/[entityName].ts`：

```typescript
import type { Model, Types } from 'mongoose';
import type { IEntityName } from '~/types';

export function createEntityNameMethods(mongoose: typeof import('mongoose')) {
  async function findEntityById(id: string | Types.ObjectId): Promise<IEntityName | null> {
    const EntityName = mongoose.models.EntityName as Model<IEntityName>;
    return await EntityName.findById(id).lean();
  }

  // ... 其他方法

  return {
    findEntityById,
    // ... 其他方法
  };
}

export type EntityNameMethods = ReturnType<typeof createEntityNameMethods>;
```

### 步驟 7：更新方法索引 (Methods Index)

新增至 `src/methods/index.ts`：

1. 導入方法：
```typescript
import { createEntityNameMethods, type EntityNameMethods } from './entityName';
```

2. 將其新增至 `createMethods()` 的返回物件中：
```typescript
...createEntityNameMethods(mongoose),
```

3. 新增至 `AllMethods` 類型：
```typescript
export type AllMethods = UserMethods &
  // ... 其他方法
  EntityNameMethods;
```

## 📝 最佳實踐

1. **命名一致性**：檔名使用小寫，類型/介面使用 PascalCase。
2. **類型安全**：始終使用 TypeScript 類型，避免使用 `any`。
3. **JSDoc 註釋**：為複雜欄位與方法編寫文件。
4. **索引 (Indexes)**：在綱要檔案中定義資料庫索引以提升查詢效能。
5. **驗證**：使用 Mongoose 綱要驗證以確保資料完整性。
6. **精簡查詢 (Lean Queries)**：當不需要 Mongoose 文件方法時，對讀取操作使用 `.lean()`。

## 🔧 常見模式

### 列舉與常數

將共享列舉放在 `src/common/`：

```typescript
// src/common/permissions.ts
export enum PermissionBits {
  VIEW = 1,
  EDIT = 2,
  DELETE = 4,
  SHARE = 8,
}
```

### 複合索引 (Compound Indexes)

對於複雜查詢，新增複合索引：

```typescript
schema.index({ field1: 1, field2: 1 });
schema.index(
  { uniqueField: 1 },
  { 
    unique: true, 
    partialFilterExpression: { uniqueField: { $exists: true } }
  }
);
```

### 虛擬屬性 (Virtual Properties)

使用 virtuals 新增計算屬性：

```typescript
schema.virtual('fullName').get(function() {
  return `${this.firstName} ${this.lastName}`;
});
```

## 🧪 測試

新增實體時，請確保：
- 類型編譯無誤。
- 模型能成功建立。
- 方法能處理邊緣案例 (空值檢查、驗證)。
- 索引已針對查詢模式進行正確定義。

## 📚 相關資源

- [Mongoose 文件](https://mongoosejs.com/docs/)
- [TypeScript 手冊](https://www.typescriptlang.org/docs/)
- [MongoDB 索引](https://docs.mongodb.com/manual/indexes/)
