import 'package:dartz/dartz.dart';

import 'package:flutter_application_shop/data/datasourse/category_datasource.dart';
import 'package:flutter_application_shop/data/model/category.dart';

import 'package:flutter_application_shop/di/di.dart';
import 'package:flutter_application_shop/utility/api_exceotion.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategories();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Category>>> getCategories() async {
    try {
      var response = await _datasource.getCategories();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
