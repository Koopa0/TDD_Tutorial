# TDD 步驟 5: Data - Repositories

在測試驅動開發（TDD）的第五步，我們專注於實現數據層中的 `Repositories`。這些 `Repositories` 實現了領域層定義的接口，並負責與數據源進行交互。

## `AuthenticationRepositoryImplementation` 類別

這個類別實現了 `AuthenticationRepository` 接口，提供了用戶數據的具體操作。

### 功能
- **`createUser`**：創建新用戶。
    - 使用 `_remoteDataSource.createUser` 方法與遠程數據源交互。
    - 處理成功和異常情況，返回 `ResultVoid`。

- **`getUsers`**：獲取用戶列表。
    - 使用 `_remoteDataSource.getUsers` 方法獲取用戶數據。
    - 處理成功和異常情況，返回 `ResultFuture<List<User>>`。

### 實現細節
- 依賴於 `AuthenticationRemoteDataSource` 以與遠程 API 進行通信。
- 封裝了從遠程數據源獲取數據的邏輯。
- 轉換 API 異常為應用內部的錯誤表示（`APIFailure`）。

## 總結

在 TDD 流程的第五步，`AuthenticationRepositoryImplementation` 作為數據層的關鍵組件，承擔了與遠程數據源交互的責任。通過實現領域層定義的 `AuthenticationRepository` 接口，這個類別確保了數據操作的一致性和可靠性，同時也使應用架構更加清晰和模組化。
