# 測試概述

這些測試案例集中在驗證 `CreateUser` 和 `GetUsers` 兩個用例的行為。為了進行測試，使用了 `MockAuthRepo` 來模擬 `AuthenticationRepository` 接口的行為。

## 具體測試內容

### CreateUser 用例測試

- **目的**：測試 `CreateUser` 用例是否正確調用了 `AuthenticationRepository` 的 `createUser` 方法。
- **設置**：
    - 使用 `MockAuthRepo` 模擬 `AuthenticationRepository`。
    - 初始化 `CreateUser` 用例。
- **測試過程**：
    - **Arrange**（安排）：設置當調用 `repository.createUser` 時，返回一個成功的結果（`Right(null)`）。
    - **Act**（執行）：調用 `usecase(params)` 並等待結果。
    - **Assert**（斷言）：確保返回的結果是成功的（`Right(null)`），並驗證 `repository.createUser` 是否被正確調用了一次。

### GetUsers 用例測試

- **目的**：測試 `GetUsers` 用例是否正確調用了 `AuthenticationRepository` 的 `getUsers` 方法。
- **設置**：
    - 使用 `MockAuthRepo` 模擬 `AuthenticationRepository`。
    - 初始化 `GetUsers` 用例。
- **測試過程**：
    - **Arrange**（安排）：設置當調用 `repository.getUsers` 時，返回一個成功的結果（用戶列表 `tResponse`）。
    - **Act**（執行）：調用 `usecase()` 並等待結果。
    - **Assert**（斷言）：確保返回的結果包含預期的用戶列表，並驗證 `repository.getUsers` 是否被正確調用了一次。

## 總結

這些測試確保了 `CreateUser` 和 `GetUsers` 用例能夠正確地與模擬的 `AuthenticationRepository` 交互，並且在調用相關方法時能夠產生預期的結果。這樣的單元測試是確保代碼質量和應用程序可靠性的重要手段。
