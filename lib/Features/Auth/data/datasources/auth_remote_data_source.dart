import 'package:dio/dio.dart';
import '../../../../Core/constants/api_constants.dart';
import '../../../../Core/network/dio_client.dart';
import '../Model/user_model.dart';

class AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSource(this.dioClient);

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await dioClient.dio.post(
      ApiConstants.login,
      data: {
        "email": email,
        "password": password,
      },
    );
    return UserModel.fromJson(response.data);
  }
}