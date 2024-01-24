# TDD 步驟 4: Data - Model

在測試驅動開發（TDD）的第四步，我們專注於數據層中的 `Model`。這些 `Model` 類別是實體的數據表示，用於處理數據的序列化和反序列化。

## `UserModel` 類別

`UserModel` 類別擴展自 `User` 實體，用於將用戶數據從應用的內部格式轉換為可以與外部系統（如 API）交互的格式。

### 功能
- **數據轉換**：提供方法來轉換數據為 JSON 格式和從 Map 對象創建實例。
- **數據複製**：`copyWith` 方法允許在創建新實例時修改特定屬性，同時保留未指定修改的其他屬性。

### 方法
- `fromMap(DataMap map)`：從 Map 對象創建 `UserModel` 實例。
- `toJson()`：將 `UserModel` 實例轉換為 JSON 字符串。
- `toMap()`：將 `UserModel` 實例轉換為 Map 對象。
- `fromJson(String source)`：從 JSON 字符串創建 `UserModel` 實例。
- `copyWith({...})`：創建一個新的 `UserModel` 實例，允許修改某些屬性而保持其他屬性不變。

### 特點
- 繼承自 `User`，保留了基礎實體的屬性。
- 提供了 JSON 和 Map 之間的轉換能力，以適應不同的數據處理需求。
- `copyWith` 方法增加了靈活性，方便在不改變整個實體的情況下更新部分屬性。

## 總結

在 TDD 流程的第四步，`UserModel` 作為數據層的重要組件，承擔了數據轉換的責任，使得數據可以在應用內部和外部系統之間順暢地流動。透過這樣的模型，應用能夠有效地處理和存儲來自不同來源的數據。
