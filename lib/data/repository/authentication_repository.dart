import 'package:dartz/dartz.dart';
import 'package:flutter_application_shop/data/datasourse/authentication_datasourse.dart';
import 'package:flutter_application_shop/di/di.dart';
import 'package:flutter_application_shop/utility/api_exceotion.dart';
import 'package:flutter_application_shop/utility/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);

  Future<Either<String, String>> login(String username, String password);
}

class AuthenticationRepository implements IAuthRepository {
  final SharedPreferences _sharedPref = locator.get();
  final IAuthenticationDatasouse _datasourse = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await _datasourse.register(username, password, passwordConfirm);
      return right('ثبت نام انجام شد');
    } on ApiException catch (ex) {
      return left(ex.message! ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _datasourse.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right(' شما وارد شدید  ');
      } else {
        return left('خطایی پیش آمده');
      }
    } on ApiException catch (ex) {
      return left(ex.message! ?? 'خطا محتوای متنی ندارد');
    }
  }
}
