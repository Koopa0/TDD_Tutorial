# TDD 步驟 10: Dependency Injection

在測試驅動開發（TDD）的第十步中，我們專注於應用中的依賴注入，這是通過使用 `GetIt` 這個服務定位器來實現的。`GetIt` 允許我們以一種解耦和可測試的方式來管理應用的依賴。

## 依賴注入的配置

### 初始化 `GetIt`
`GetIt` 作為一個全局變量 `sl`（Service Locator）被初始化，用於在整個應用中註冊和檢索依賴。

### 註冊流程

#### 1. Application Logic
- **AuthenticationCubit**：使用 `registerFactory` 方法註冊，每次請求時都會創建一個新的 `AuthenticationCubit` 實例。

#### 2. Use Cases
- **CreateUser** 和 **GetUsers**：這兩個用例作為懶加載單例（Lazy Singleton）註冊，確保在整個應用中只有一個實例。

#### 3. Repositories
- **AuthenticationRepository**：用例依賴的存儲庫被註冊為懶加載單例。

#### 4. DataSources
- **AuthenticationRemoteDataSource**：負責與遠程服務交互的數據源也作為懶加載單例註冊。

#### 5. External Dependencies
- **http.Client**：HTTP 客戶端作為懶加載單例註冊，用於執行網絡請求。

## 總結

使用 `GetIt` 進行依賴注入提供了一種有效的方式來管理應用的依賴，增加了代碼的模塊化和測試性。通過這種方法，應用的不同部分可以獨立於彼此工作，同時保持了靈活性和可擴展性。這種策略對於維護大型應用的清晰度和一致性至關重要。
