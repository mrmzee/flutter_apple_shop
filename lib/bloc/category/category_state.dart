import 'package:dartz/dartz.dart';
import 'package:flutter_application_shop/data/model/category.dart';

abstract class CategoryState {}

class CategoryInstanseState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  Either<String, List<Category>> response;
  CategoryResponseState(this.response);
}

class CategoryLoadingState extends CategoryState {}
