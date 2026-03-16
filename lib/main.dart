import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Core/network/dio_client.dart';
import 'Features/Auth/data/datasources/auth_remote_data_source.dart';
import 'Features/Auth/data/repositories/auth_repository_impl.dart';

import 'Features/Auth/domain/usecase/login_usecase.dart';
import 'Features/Auth/domain/usecase/register_usecase.dart';
import 'Features/Auth/presentation/Cubit/login_cubit.dart';
import 'Features/Auth/presentation/Cubit/register_cubit.dart';
import 'Features/Auth/presentation/screens/login.dart';

void main() {
  final dioClient = DioClient();
  final remoteDataSource = AuthRemoteDataSource(dioClient);
  final repository = AuthRepositoryImpl(remoteDataSource);

  final loginUseCase = LoginUseCase(repository);
  final registerUseCase = RegisterUsecase(repository);

  runApp(
    SocialHive(
      loginUseCase: loginUseCase,
      registerUseCase: registerUseCase,
    ),
  );
}

class SocialHive extends StatelessWidget {
  final LoginUseCase loginUseCase;
  final RegisterUsecase registerUseCase;

  const SocialHive({
    super.key,
    required this.loginUseCase,
    required this.registerUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit(loginUseCase)),
        BlocProvider(create: (_) => RegisterCubit(registerUseCase)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Login(),
      ),
    );
  }
}