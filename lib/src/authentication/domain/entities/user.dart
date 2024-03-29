import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });
  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  const User.empty()
      : this(
          id: "1",
          createdAt: "_empty.createdAt",
          name: "_empty.name",
          avatar: "_empty.avatar",
        );

  // 通過 Equatable package 定義 要根據 object 的哪個欄位來判斷 object 是否相同
  @override
  List<Object?> get props => [id, name, avatar];
}
