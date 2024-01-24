# 測試重點

這組單元測試針對 `AuthenticationRemoteDataSourceImpl` 的方法 `createUser` 和 `getUsers` 進行驗證，以確保這些方法能正確地處理來自 HTTP 客戶端的響應。

## 測試內容

### `createUser` 方法測試

- **成功情況測試**：
    - **目的**：確保當 HTTP 客戶端返回狀態碼 201 時，`createUser` 方法能夠正常完成。
    - **方法**：模擬 HTTP 客戶端返回狀態碼 201，然後調用 `createUser` 方法並驗證是否成功完成。

- **失敗情況測試**：
    - **目的**：確保當 HTTP 客戶端返回狀態碼 400 時，`createUser` 方法能夠拋出 `APIException`。
    - **方法**：模擬 HTTP 客戶端返回狀態碼 400，然後調用 `createUser` 方法並驗證是否拋出 `APIException`。

### `getUsers` 方法測試

- **成功情況測試**：
    - **目的**：確保當 HTTP 客戶端返回狀態碼 200 時，`getUsers` 方法能夠返回用戶列表。
    - **方法**：模擬 HTTP 客戶端返回狀態碼 200，然後調用 `getUsers` 方法並驗證返回的結果是否為用戶列表。

- **失敗情況測試**：
    - **目的**：確保當 HTTP 客戶端返回狀態碼 500 時，`getUsers` 方法能夠拋出 `APIException`。
    - **方法**：模擬 HTTP 客戶端返回狀態碼 500，然後調用 `getUsers` 方法並驗證是否拋出 `APIException`。

## 總結

這組單元測試確保了 `AuthenticationRemoteDataSourceImpl` 在處理不同的 HTTP 響應時能夠表現出預期的行為，無論是處理成功的情況還是錯誤的情況。這種測試方法提高了代碼的健壯性和可靠性。
