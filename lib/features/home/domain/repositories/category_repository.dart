import 'package:finmanageapp/core/util/params/category_params.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<CategoryModel> register({required CreateCategoryParams params});

  Future<List<CategoryModel>> fetchAllByType(
      {required GetByTransactionTypeParams params});
}