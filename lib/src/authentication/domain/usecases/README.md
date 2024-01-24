# TDD 步驟 3: Domain - Usecases

在測試驅動開發（TDD）的第三步，我們專注於定義應用的業務邏輯，即 `Usecases`。這些 `Usecases` 是應用中實現特定功能的元件，它們依賴於領域層的 `Repositories`。

## `GetUsers` Usecase

`GetUsers` Usecase 負責獲取用戶列表，這是一個不需要參數的業務操作。

### 實現細節
- **依賴**：`GetUsers` 依賴於 `AuthenticationRepository` 來獲取用戶數據。
- **方法**：調用 `AuthenticationRepository.getUsers` 以獲取用戶列表。
- **類型**：繼承自 `UsecaseWithoutParams`，返回類型為 `List<User>`。

## `CreateUser` Usecase

`CreateUser` Usecase 負責創建新的用戶，需要一組參數來指定用戶的細節。

### 實現細節
- **依賴**：`CreateUser` 依賴於 `AuthenticationRepository` 來進行用戶創建操作。
- **方法**：調用 `AuthenticationRepository.createUser` 並傳入 `CreateUserParams`。
- **`CreateUserParams`**：具有 `createdAt`、`name`、和 `avatar` 屬性的數據類，繼承自 `Equatable`。
- **類型**：繼承自 `UsecaseWithParams`，返回類型為 `void`。

## 總結

在 TDD 的第三步，這些 `Usecases` 代表了應用程序的核心業務邏輯。通過將業務邏輯封裝在 `Usecases` 中，我們可以保持代碼的清晰和組織，同時便於進行單元測試。`GetUsers` 和 `CreateUser` 這兩個 `Usecases` 展示了如何從領域層的 `Repositories` 獲取和操作數據，從而實現特定的業務需求。
