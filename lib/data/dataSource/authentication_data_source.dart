import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/util/auth_manager.dart';
import 'package:dio/dio.dart';

abstract class IAuthenticationDataSource {
  Future<void> register(
      String username, String password, String passwordConfirm);

  Future<String> login(String username, String password);
}

class AuthenticationRemote implements IAuthenticationDataSource {
  final Dio dio;

  AuthenticationRemote({required this.dio});

  @override
  Future<void> register(
      String username, String password, String passwordConfirm) async {
    try {
      var response = await dio.post('collections/users/records', data: {
        'username': username,
        'name': username,
        'password': password,
        'passwordConfirm': passwordConfirm,
      });
      if (response.statusCode == 200) {
        login(username, password);
      }
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data['message'],
          response: e.response);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      final response =
          await dio.post('collections/users/auth-with-password', data: {
        'identity': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        AuthManager.saveId(response.data?['record']['id']);
        AuthManager.saveUserName(response.data?['record']['username']);
        AuthManager.saveToken(response.data?['token']);
        return response.data?['token'];
      }
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
    return '';
  }
}
