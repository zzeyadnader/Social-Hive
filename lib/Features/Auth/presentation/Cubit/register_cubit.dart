import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/register_usecase.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register({
    required String email,
    required String username,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoading());

    try {
      final user = await registerUseCase(
        email: email,
        username: username,
        password: password,
        name: name,
      );

      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterError(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}