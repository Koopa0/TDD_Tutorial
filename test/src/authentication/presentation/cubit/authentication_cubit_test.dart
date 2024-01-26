import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/core/errors/failure.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/get_users.dart';
import 'package:tdd_tutorial/src/authentication/presentation/cubit/authentication_cubit.dart';

class MockGetUsers extends Mock implements GetUsers {}

class MockCreateUser extends Mock implements CreateUser {}

void main() {
  late GetUsers getUsers;
  late CreateUser createUser;
  late AuthenticationCubit cubit;
  const tCreateUserParams = CreateUserParams.empty();
  const tAPIFailure = APIFailure(message: "message", statusCode: 400);

  setUp(() {
    getUsers = MockGetUsers();
    createUser = MockCreateUser();
    cubit = AuthenticationCubit(
      createUser: createUser,
      getUsers: getUsers,
    );
    registerFallbackValue(tCreateUserParams);
  });

  // tearDown 函數確保每次測試結束後關閉 Cubit
  tearDown(() => cubit.close());

  // 測試“初始狀態”
  // 測試驗證初始狀態是否為 AuthenticationInitial。這是確保 Cubit 正確初始化的基本測試
  test("initial state should be [AuthenticationInitial]", () async {
    expect(cubit.state, const AuthenticationInitial());
  });

  group("createUser", () {
    blocTest<AuthenticationCubit, AuthenticationState>(
      "should emit [CreatingUser, UserCreated] when successful",
      // Build：設置測試環境。這行代碼模擬了 createUser 方法的成功調用。
      build: () {
        when(() => createUser(any()))
            .thenAnswer((_) async => const Right(null));
        return cubit;
      },
      // 觸發測試動作。調用 Cubit 的 createUser 方法。
      act: (cubit) => cubit.createUser(
        createdAt: tCreateUserParams.createdAt,
        name: tCreateUserParams.name,
        avatar: tCreateUserParams.avatar,
      ),

      // 預期的狀態序列。
      // 測試期望 Cubit 首先發出 CreatingUser 狀態，表示正在創建用戶，隨後發出 UserCreated 狀態，表示用戶創建成功。
      expect: () => const [
        CreatingUser(),
        UserCreated(),
      ],

      // 驗證模擬對象的行為。確認 createUser 被正確調用一次，並且沒有更多的交互。
      verify: (_) {
        verify(() => createUser(tCreateUserParams)).called(1);
        verifyNoMoreInteractions(createUser);
      },
    );

    blocTest<AuthenticationCubit, AuthenticationState>(
      "should emit [Creating User , AuthenticationError] when unsuccessful",
      build: () {
        when(() => createUser(any())).thenAnswer(
          (_) async => const Left(tAPIFailure),
        );
        return cubit;
      },
      act: (cubit) => cubit.createUser(
        createdAt: tCreateUserParams.createdAt,
        name: tCreateUserParams.name,
        avatar: tCreateUserParams.avatar,
      ),
      expect: () => [
        const CreatingUser(),
        AuthenticationError(tAPIFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => createUser(tCreateUserParams)).called(1);
        verifyNoMoreInteractions(createUser);
      },
    );
  });

  group("getUsers", () {
    blocTest<AuthenticationCubit, AuthenticationState>(
        "should emit [GettingUsers, UsersLoaded] when successful",
        build: () {
          when(() => getUsers()).thenAnswer((_) async => const Right([]));
          return cubit;
        },
        act: (cubit) => cubit.getUsers(),
        expect: () => const [
              GettingUsers(),
              UsersLoaded([]),
            ],
        verify: (_) {
          verify(() => getUsers()).called(1);
          verifyNoMoreInteractions(getUsers);
        });

    blocTest<AuthenticationCubit, AuthenticationState>(
        "should emit [GettingUsers, AuthenticationError] when unsuccessful",
        build: () {
          when(() => getUsers())
              .thenAnswer((_) async => const Left(tAPIFailure));
          return cubit;
        },
        act: (cubit) => cubit.getUsers(),
        expect: () => [
              const GettingUsers(),
              AuthenticationError(tAPIFailure.errorMessage),
            ],
        verify: (_) {
          verify(() => getUsers()).called(1);
          verifyNoMoreInteractions(getUsers);
        });
  });
}
