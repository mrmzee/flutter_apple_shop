import 'package:dio/dio.dart';
import 'package:flutter_application_shop/data/model/category.dart';
import 'package:flutter_application_shop/di/di.dart';
import 'package:flutter_application_shop/utility/api_exceotion.dart';

abstract class ICategoryDatasource {
  Future<List<Category>> getCategories();
}

class CategoryRemoteDatasource extends ICategoryDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Category>> getCategories() async {
    try {
      var respones = await _dio.get('collections/category/records');
      return (respones.data['items'] as List)
          .map<Category>(
            (jsonObject) => Category.fromMapJson(jsonObject),
          )
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'error');
    }
  }
}
