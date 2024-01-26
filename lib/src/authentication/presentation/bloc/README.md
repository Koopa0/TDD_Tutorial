# TDD 步驟 7: Presentation - Bloc

在測試驅動開發（TDD）的第七步，我們專注於表示層（Presentation Layer），特別是實現 Bloc。`AuthenticationBloc` 負責管理身份驗證相關的事件和狀態。

## `AuthenticationBloc`

`AuthenticationBloc` 繼承自 Bloc 庫中的 `Bloc` 類，用於處理身份驗證相關的業務邏輯。

### 功能
- 接收 `CreateUser` 和 `GetUsers` 用例作為依賴，處理用戶創建和獲取用戶列表的操作。
- 根據業務操作的結果更新應用的狀態。

### 方法
- `_createUserHandler`：處理 `CreateUserEvent`，根據創建用戶操作的結果發出相應的狀態。
- `_getUsersHandler`：處理 `GetUsersEvent`，根據獲取用戶列表操作的結果更新狀態。

### 事件（`AuthenticationEvent`）

#### 定義
- `CreateUserEvent`：用於觸發創建用戶的操作。
- `GetUsersEvent`：用於觸發獲取用戶列表的操作。

### 狀態（`AuthenticationState`）

#### 定義
- `AuthenticationInitial`：初始狀態。
- `CreatingUser`：表示正在創建用戶的狀態。
- `GettingUsers`：表示正在獲取用戶列表的狀態。
- `UserCreated`：表示用戶創建成功的狀態。
- `UsersLoaded`：表示用戶列表獲取成功的狀態。
- `AuthenticationError`：表示操作失敗的狀態。

## 總結

`AuthenticationBloc` 在表示層中扮演著關鍵角色，它將用戶界面（UI）與業務邏輯分離，確保了代碼的清晰和可維護性。通過對事件的響應和狀態的管理，它提供了一個靈活而強大的方式來處理身份驗證相關的業務邏輯。此外，相關的單元測試確保了 Bloc 的行為與預期一致，進一步增強了代碼的可靠性和可維護性。
