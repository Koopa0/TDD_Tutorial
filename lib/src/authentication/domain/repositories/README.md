# TDD 步驟 2: Domain - Repositories

在測試驅動開發（TDD）的第二步，我們專注於定義領域層中的 `Repositories`。這些 `Repositories` 定義了應用程式與數據源之間的合約，並為業務邏輯層提供數據。以下是對您提供的 `AuthenticationRepository` 接口的歸納。

## `AuthenticationRepository` 接口

`AuthenticationRepository` 定義了與身份驗證相關的數據操作。

### 功能
- **`createUser`**：創建新用戶的方法。
    - **參數**：
        - `createdAt`：用戶創建時間。
        - `name`：用戶名稱。
        - `avatar`：用戶頭像。
    - **回傳類型**：`ResultVoid`，表示操作可能成功或失敗，但不返回數據。

- **`getUsers`**：獲取用戶列表的方法。
    - **回傳類型**：`ResultFuture<List<User>>`，表示異步返回用戶列表。

### 特點
- 為 `User` 實體相關的操作提供抽象接口。
- 允許進行用戶的創建和查詢操作。
- 作為數據源層和業務邏輯層之間的中介。

## 總結

在 TDD 流程的第二步，`AuthenticationRepository` 作為領域層的關鍵部分，提供了清晰的界面來訪問應用程式的數據。通過定義這樣的接口，我們確保了業務邏輯與數據存取邏輯之間的解耦，從而使代碼更加模組化、可測試並易於維護。
