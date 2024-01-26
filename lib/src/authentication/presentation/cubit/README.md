# TDD 步驟 7: Presentation - Cubit

在測試驅動開發（TDD）的第七步中，我們專注於表示層（Presentation Layer）的 Cubit 部分。`AuthenticationCubit` 負責管理身份驗證相關的業務邏輯和狀態。

## `AuthenticationCubit`

`AuthenticationCubit` 是用於身份驗證業務邏輯的 Cubit。

### 功能
- 管理用戶的創建 (`createUser`) 和獲取 (`getUsers`) 操作。
- 根據業務操作的結果更新應用的狀態。

### 方法
- `createUser`：執行創建用戶的操作，並根據操作結果發出相應狀態。
- `getUsers`：執行獲取用戶列表的操作，並根據結果更新狀態。

### 狀態（`AuthenticationState`）

#### 定義
- `AuthenticationInitial`：初始狀態。
- `CreatingUser`：表示正在創建用戶的狀態。
- `GettingUsers`：表示正在獲取用戶列表的狀態。
- `UserCreated`：表示用戶創建成功的狀態。
- `UsersLoaded`：表示用戶列表獲取成功的狀態。
- `AuthenticationError`：表示操作失敗的狀態。

## 總結

`AuthenticationCubit` 在表示層中扮演著關鍵角色，提供了一種有效的方式來處理身份驗證相關的業務邏輯和狀態管理。通過明確定義的狀態和方法，它確保了應用的用戶界面可以根據業務操作的不同結果進行動態更新，同時保持代碼的清晰和組織性。這種架構有助於提高應用的可維護性和可測試性。
