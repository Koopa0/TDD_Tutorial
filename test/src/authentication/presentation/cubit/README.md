# TDD 步驟 7: Presentation - Bloc/Cubit

在測試驅動開發（TDD）的第七步，我們專注於實現表示層（Presentation Layer）中的 Bloc 或 Cubit。這些組件是負責處理應用業務邏輯和狀態管理的關鍵部分。

## `AuthenticationCubit`

`AuthenticationCubit` 是用於管理身份驗證相關狀態和事件的 Cubit。

### 功能
- 負責處理用戶創建 (`createUser`) 和獲取用戶列表 (`getUsers`) 的操作。
- 根據業務操作的結果更新應用的狀態。

### 方法
- `createUser`：接收用戶信息並執行創建用戶的操作，然後根據操作結果發出相應的狀態（成功或錯誤）。
- `getUsers`：執行獲取用戶列表的操作，並根據結果更新狀態。

### 狀態
- `AuthenticationInitial`：初始狀態。
- `CreatingUser`：表示正在創建用戶的狀態。
- `UserCreated`：表示用戶創建成功的狀態。
- `GettingUsers`：表示正在獲取用戶列表的狀態。
- `UsersLoaded`：表示用戶列表獲取成功的狀態。
- `AuthenticationError`：表示操作失敗的狀態。

### 單元測試
- 測試了 `createUser` 和 `getUsers` 方法的不同行為。
- 使用 `blocTest` 函數模擬不同的操作和狀態變化。
- 驗證了 Cubit 是否根據業務邏輯正確地更新狀態。

## 總結

在 TDD 流程的第七步，`AuthenticationCubit` 作為表示層的關鍵組件，承擔了應用中身份驗證相關業務邏輯的處理和狀態管理。通過這樣的實現，應用能夠根據不同的業務操作動態更新 UI，同時保持代碼的清晰和組織性。此外，相關的單元測試確保了 Cubit 的行為與預期一致，增強了代碼的可靠性和可維護性。
