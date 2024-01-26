# Flutter 應用主入口 - main.dart

在 Flutter 應用的 `main.dart` 文件中，我們設置並啟動應用的主要功能。這個文件是應用的入口點，負責初始化和配置應用的基礎環境。

## 主要功能

### 初始化
- **WidgetsFlutterBinding.ensureInitialized()**：這行代碼確保 Flutter 組件綁定初始化。這是在執行任何 Flutter 相關操作之前必需的，特別是當你的 Flutter 應用需要在 main 函數中執行異步操作時。

### 依賴注入
- **await init()**：這行代碼調用 `init` 函數來初始化依賴注入容器。這是通過 `GetIt` 實現的，註冊了整個應用所需的依賴。

### 應用運行
- **runApp(const MainApp())**：使用 `runApp` 函數來啟動應用。`MainApp` 是應用的根組件。

## MainApp 組件

`MainApp` 是一個無狀態組件（StatelessWidget），用於構建和配置應用的主界面。

### MaterialApp
- 在 `MainApp` 中，使用 `MaterialApp` 組件來設置應用的主題、路由等。
- **theme**：設置應用的主題，包括使用 Material3、視覺密度等。
- **home**：設置應用的首頁，這裡是 `HomeScreen`。

### BlocProvider
- 使用 `BlocProvider` 來為應用提供 `AuthenticationCubit`。這樣可以在整個應用中訪問並使用 `AuthenticationCubit`。

## 總結

在 `main.dart` 文件中，我們完成了應用的初始化，設置了依賴注入，並配置了基本的 UI 結構。這樣的設置確保了應用在啟動時就已經準備好了所需的所有資源和配置，為用戶提供了一個穩定且一致的使用體驗。
