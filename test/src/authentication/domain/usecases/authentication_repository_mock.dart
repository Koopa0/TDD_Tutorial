// 創建了一個名為 MockAuthRepo 的類，它繼承自 Mock 並實現了 AuthenticationRepository 接口。
// 這個模擬對象將用於在測試中模擬 AuthenticationRepository 的行為。

import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}
