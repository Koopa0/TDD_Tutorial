# TDD 步驟 6: Data - DataSources

在測試驅動開發（TDD）的第六步，我們關注數據層中的 `DataSources`。這些 `DataSources` 負責與外部數據源（例如 API）進行直接交互。以下是對您提供的 `AuthenticationRemoteDataSourceImpl` 的歸納。

## `AuthenticationRemoteDataSourceImpl` 類別

`AuthenticationRemoteDataSourceImpl` 實現了 `AuthenticationRemoteDataSource` 接口，用於處理與遠程 API 的通信。

### 功能
- **`createUser`**：向 API 發送請求以創建新用戶。
    - 檢查 HTTP 響應碼，並在響應碼不是 200 或 201 時拋出 `APIException`。

- **`getUsers`**：從 API 獲取用戶列表。
    - 解析 HTTP 響應並將其轉換為 `UserModel` 列表。
    - 在響應碼不是 200 時拋出 `APIException`。

### 實現細節
- 使用 `http.Client` 與遠程 API 進行交互。
- 提供了從 JSON 到 `UserModel` 的轉換能力。
- 處理 API 請求的異常情況並轉換為內部異常表示（`APIException`）。

### 端點常數
- `kCreateUserEndpoint`：用於創建用戶的 API 端點。
- `kGetUsersEndpoint`：用於獲取用戶列表的 API 端點。

## 總結

在 TDD 流程的第六步，`AuthenticationRemoteDataSourceImpl` 作為數據層與外部數據源（API）的橋樑，承擔了與 API 進行交互的責任。透過實現 `AuthenticationRemoteDataSource` 接口，這個類別確保了應用能夠有效地與遠程數據源進行通信並處理來自該數據源的數據。
