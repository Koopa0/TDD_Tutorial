# 測試重點

這組測試主要針對 `UserModel` 類，它是 `User` 實體的數據模型，用於表示和操作用戶數據。測試覆蓋了模型的類型、數據轉換、以及修改功能。

## 具體測試內容

### 1. 類型測試

- **目的**：確保 `UserModel` 是 `User` 實體的子類。
- **方法**：使用 `expect` 斷言檢查 `tModel` 是否是 `User` 類的實例。

### 2. fromMap 方法測試

- **目的**：測試 `UserModel.fromMap` 方法是否能正確地從 `Map` 對象創建 `UserModel` 實例。
- **方法**：將一個預定義的 `Map` 對象傳遞給 `fromMap` 方法，並檢查返回的 `UserModel` 是否與預期的模型 `tModel` 相等。

### 3. fromJson 方法測試

- **目的**：測試 `UserModel.fromJson` 方法是否能從 JSON 字符串正確地創建 `UserModel` 實例。
- **方法**：將一個 JSON 字符串傳遞給 `fromJson` 方法，並檢查返回的 `UserModel` 是否與預期的模型 `tModel` 相等。

### 4. toMap 方法測試

- **目的**：測試 `UserModel.toMap` 方法是否能將 `UserModel` 實例正確地轉換為 `Map` 對象。
- **方法**：對 `tModel` 調用 `toMap` 方法，並檢查返回的 `Map` 對象是否與預期的 `Map` 對象 `tMap` 相等。

### 5. toJson 方法測試

- **目的**：測試 `UserModel.toJson` 方法是否能將 `UserModel` 實例正確地轉換為 JSON 字符串。
- **方法**：對 `tModel` 調用 `toJson` 方法，並檢查返回的 JSON 字符串是否與預期的 JSON 字符串相等。

### 6. copyWith 方法測試

- **目的**：測試 `UserModel.copyWith` 方法是否能正確地修改 `UserModel` 實例的數據。
- **方法**：對 `tModel` 使用 `copyWith` 方法進行修改，並驗證返回的 `UserModel` 實例的特定屬性（如 `name`）是否被正確更新。

## 總結

這組單元測試全面檢驗了 `UserModel` 的各項功能，確保數據模型的行為與預期一致。通過這樣的測試，您可以確保 `UserModel` 在數據轉換和操作方面的可靠性和正確性，這對於應用程序的整體數據處理非常重要。
