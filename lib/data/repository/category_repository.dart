import 'package:apple_shop/data/dataSource/category_data_source.dart';
import 'package:apple_shop/models/category.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategories();
}

class CategoryRepository implements ICategoryRepository {
  final ICategoryDataSource dataSource;

  CategoryRepository({required this.dataSource});
  @override
  Future<Either<String, List<Category>>> getCategories() async {
    try {
      List<Category> categoryList = await dataSource.getCategories();
      return right(categoryList);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
