import 'package:dio/dio.dart';
import 'package:flutter_application_shop/data/datasourse/authentication_datasourse.dart';
import 'package:flutter_application_shop/data/datasourse/category_datasource.dart';
import 'package:flutter_application_shop/data/repository/authentication_repository.dart';
import 'package:flutter_application_shop/data/repository/category_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.I;
Future<void> getItInit() async {
  //componenets
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/')));

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
//datasourse
  locator
      .registerFactory<IAuthenticationDatasouse>(() => AuthenticationRemote());

  locator
      .registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());

  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());

  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
}
