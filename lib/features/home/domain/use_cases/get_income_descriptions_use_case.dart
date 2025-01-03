import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/features/home/domain/repositories/description_repository.dart';

class GetIncomeDescriptionsUseCase
    extends UseCase<List<DescriptionModel>, void> {
  final DescriptionRepository _repository;

  GetIncomeDescriptionsUseCase(this._repository);

  @override
  Future<List<DescriptionModel>> call({void params}) {
    return _repository.fetchAllByType(
        params: const GetByTransactionTypeParams(type: TransactionType.income));
  }
}
