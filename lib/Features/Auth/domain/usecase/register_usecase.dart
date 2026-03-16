import '../Entity/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<UserEntity> call({required String email, required String username, required String password, required String name}) async {
    return await repository.register(email: email, username: username, password: password, name: name);
  }
}