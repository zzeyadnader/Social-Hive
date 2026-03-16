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
    try {
      final response = await dioClient.dio.post(
        ApiConstants.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  Future<UserModel> register({
    required String email,
    required String username,
    required String password,
    required String name,
  }) async {
    try {
      final response = await dioClient.dio.post(
        ApiConstants.register,
        data: {
          "email": email,
          "username": username,
          "password": password,
          "name": name,
        },
      );

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  String _handleDioError(DioException e) {
    final data = e.response?.data;

    if (data is Map<String, dynamic>) {
      String message = data["message"] ?? data["error"] ?? "Something went wrong";

      // ناخد أول error بس
      message = message.split(";").first;

      // نشيل body.email أو body.password
      message = message.replaceAll(RegExp(r'body\.\w+:\s*'), '');

      return message.trim();
    }

    return "Something went wrong";
  }
}