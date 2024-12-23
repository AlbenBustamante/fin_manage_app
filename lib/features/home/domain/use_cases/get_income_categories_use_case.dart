import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/domain/repositories/category_repository.dart';

import '../../data/models/category_model.dart';

class GetIncomeCategoriesUseCase extends UseCase<List<CategoryModel>, void> {
  final CategoryRepository _repository;

  GetIncomeCategoriesUseCase(this._repository);

  @override
  Future<List<CategoryModel>> call({void params}) {
    return _repository.fetchAllByType(
        params: const GetByTransactionTypeParams(type: TransactionType.income));
  }
}
