
import '../../domain/Entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.username,
    required super.name,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"];
    final user = data["user"];

    return UserModel(
      id: user["id"],
      email: user["email"],
      username: user["username"],
      name: user["name"],
      token: data["token"],
    );
  }
}