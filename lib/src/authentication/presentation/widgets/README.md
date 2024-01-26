# TDD 步驟 8: Presentation - Widgets

在測試驅動開發（TDD）的第八步中，表示層的 Widgets 部分扮演著關鍵角色。這裡介紹的是 `AddUserDialog` 和 `LoadingColumn` 這兩個自定義的 Widgets。

## `AddUserDialog` Widget

`AddUserDialog` 是一個用於添加新用戶的對話框組件。

### 功能
- 提供用戶輸入界面，允許用戶輸入新用戶的信息。
- 通過 `AuthenticationCubit` 觸發創建用戶的操作。

### 界面結構
- 使用 `TextField` 接收用戶名的輸入。
- 包含一個 `ElevatedButton`，用於提交信息並觸發用戶創建的操作。

### 事件處理
- 按鈕點擊時，從 `nameController` 獲取輸入的用戶名，並通過 Cubit 發起創建用戶的請求。

## `LoadingColumn` Widget

`LoadingColumn` 是一個用於顯示加載狀態的組件。

### 功能
- 在等待過程中向用戶顯示一個加載指示器（`CircularProgressIndicator`）。
- 提供一個文本欄位用於顯示加載信息。

### 界面結構
- `CircularProgressIndicator` 用於顯示正在進行的操作。
- `Text` Widget 顯示傳入的 `message`，告知用戶目前的加載狀態。

## 總結

`AddUserDialog` 和 `LoadingColumn` 這兩個 Widgets 在應用中提供了用戶交互和反饋的重要界面元素。它們與 `AuthenticationCubit` 緊密結合，使應用能夠以用戶友好的方式反映當前的業務邏輯和狀態。這些自定義 Widgets 增強了應用的互動性和視覺吸引力，同時簡化了用戶操作流程。
