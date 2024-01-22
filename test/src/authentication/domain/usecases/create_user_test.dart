/*
  一個 class 依賴於一個 repository。可以使用 mocktail 創建一個依賴項的假版本。class 依賴於 AuthenticationRepository。

  因此，創建一個名為 MockAuthRepo 的 class，並讓它擴展 Mock class。然後最終 Mock AuthenticationRepository()。

  接著創建一個名為 main() 的函數。

  所有測試的入口點是 void main(){}。

  test() 來自 Flutter 測試包。整個測試的內容都放在 test() 函數內。在 test() 函數內部，首先調用 when() 函數。接著會調用 repository 函數。在這個案例中，將調用 createUser()。

  使用 thenAnswer() 進行異步調用()。

  使用 thenReturn() 進行非異步調用。

  安排和存根（Stubbing）同時發生。

  使用 await usecase(params)，這進行調用。

  expect() 函數取得結果並與預期值進行檢查。因此，第二個參數進行檢查。

  需要確保它調用 AuthRepo.createUser 方法。

  使用 verify() 來檢查 usecase 是否真的被調用。所以通過 verify() 函數確保 AuthRepo.createUser() 被調用。因為確保這次調用只有一次，所以使用 called(1)。

  因此，基本上 verify() 函數會再次檢查調用 history 。
 */
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repository_mock.dart';

void main() {
  // 使用 late 關鍵字延遲初始化 usecase 和 repository 變量。

  late CreateUser usecase;
  late AuthenticationRepository repository;

  // 在 setUpAll 方法中，初始化 repository 為 MockAuthRepo 實例
  // 並初始化 usecase 為 CreateUser 實例，該實例使用模擬的 repository。

  setUpAll(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();
  test(
    "should call the Repository.createUser",
    () async {
      // Arrange 使用 when 方法模擬 repository.createUser 方法的行為，使其返回 const Right(null)。
      // thenReturn 適用於不想等待回傳值的函數
      // 如果是 async 函數 需要使用 thenAnswer

      when(
        () => repository.createUser(
          createdAt: any(named: "createdAt"),
          name: any(named: "name"),
          avatar: any(named: "avatar"),
        ),
      ).thenAnswer((_) async => const Right(null));

      // Act 調用 usecase(params) 方法，並等待結果。

      final result = await usecase(params);

      // Assert
      // 驗證 result 是否等於 const Right<dynamic, void>(null)。
      // 驗證 repository.createUser 方法是否被調用了一次，並且調用參數正確。
      // 驗證 repository 沒有其他未被驗證的互動。

      expect(result, equals(const Right<dynamic, void>(null)));
      verify(
        () => repository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        ),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
