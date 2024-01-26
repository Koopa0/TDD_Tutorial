# TDD 步驟 8: Presentation - Views

在測試驅動開發（TDD）的第八步，我們專注於表示層（Presentation Layer）中的 Views 部分。`HomeScreen` 是應用的主要界面，展示了用戶交互和數據顯示。

## `HomeScreen` 組件

`HomeScreen` 是 Flutter 應用中的一個 `StatefulWidget`，用於顯示和管理用戶界面。

### 功能
- 展示用戶列表。
- 提供界面操作來觸發身份驗證相關的操作，如獲取用戶列表和創建新用戶。

### 方法
- `getUsers`：觸發 `AuthenticationCubit` 的 `getUsers` 方法來獲取用戶列表。
- `initState`：在組件初始化時自動調用 `getUsers` 方法。

### 界面結構
- 使用 `BlocConsumer` 來監聽 `AuthenticationCubit` 的狀態變化並重建 UI。
- 根據不同的狀態（如 `GettingUsers`、`CreatingUser`、`UsersLoaded`）展示不同的界面元素。

### 事件處理
- 當狀態為 `AuthenticationError` 時，顯示錯誤信息。
- 當用戶創建成功時，重新調用 `getUsers` 方法來刷新用戶列表。

### UI 元件
- `FloatingActionButton`：提供添加新用戶的操作。
- `AddUserDialog`：用於接收新用戶的信息。

## 總結

`HomeScreen` 作為應用的主界面，承擔了用戶與應用交互的重要角色。它與 `AuthenticationCubit` 緊密結合，根據業務邏輯的變化動態更新 UI，並處理用戶的輸入與操作。這種設計模式不僅提高了用戶體驗，也保證了界面與業務邏輯的分離，有助於提高代碼的可維護性和可擴展性。
