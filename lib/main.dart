import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Core/network/dio_client.dart';
import 'Features/Auth/data/datasources/auth_remote_data_source.dart';
import 'Features/Auth/data/repositories/auth_repository_impl.dart';
import 'Features/Auth/domain/usecase/login_usecase.dart';
import 'Features/Auth/presentation/Cubit/login_cubit.dart';
import 'Features/Auth/presentation/screens/login.dart';

void main() {
  final dioClient = DioClient();
  final remoteDataSource = AuthRemoteDataSource(dioClient);
  final repository = AuthRepositoryImpl(remoteDataSource);
  final loginUseCase = LoginUseCase(repository);
  runApp(SocialHive(loginUseCase: loginUseCase))  ;
}
class SocialHive extends StatelessWidget {
  final LoginUseCase loginUseCase;
  const SocialHive({super.key, required this.loginUseCase});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => LoginCubit(loginUseCase),
        child: Login(),
      ),
    );
  }
}