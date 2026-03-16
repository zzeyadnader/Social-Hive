import 'package:social_hive/Features/Auth/presentation/screens/register.dart';

import '../Entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login({
    required String email,
    required String password,
  });
  Future<UserEntity> register({
    required String email,
    required String username,
    required String password,
    required String name,
  });
}