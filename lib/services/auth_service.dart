import 'package:dio/dio.dart';
import 'package:socialmedia/models/user_model.dart';

class AuthService {
  static Dio dio = Dio();

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post("https://socialmediaapi.runasp.net/api/Account/Login",
        data: {"email": email, "password": password},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to login: ${e.message}');
    } catch (otherError) {
      throw Exception(otherError.toString());
    }
  }

  static Future<UserModel> signUp({
    required String userName,
    required String email,
    required String password,
        required String confirmPassword,

  }) async {
    try {
      Response response = await dio.post(
        "https://socialmediaapi.runasp.net/api/Account/Signup",
        data: {
          "userName": userName,
          "email": email,
          "password": password,
          "confirmPassword":confirmPassword,
        },
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (otherError) {
      throw Exception(otherError);
    }
  }
}
