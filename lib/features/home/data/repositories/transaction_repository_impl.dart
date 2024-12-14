import 'package:finmanageapp/core/api/api_collections.dart';
import 'package:finmanageapp/core/util/params/category_params.dart';
import 'package:finmanageapp/core/util/params/description_params.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';
import 'package:finmanageapp/features/home/domain/entities/transaction_entity.dart';
import 'package:finmanageapp/features/home/domain/repositories/category_repository.dart';
import 'package:finmanageapp/features/home/domain/repositories/description_repository.dart';
import 'package:finmanageapp/features/home/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final _collection = ApiCollections.transactions;
  final CategoryRepository _categoryRepository;
  final DescriptionRepository _descriptionRepository;
  final String _userId;

  TransactionRepositoryImpl(
      this._userId, this._categoryRepository, this._descriptionRepository);

  @override
  Future<TransactionModel> register(
      {required CreateTransactionParams params}) async {
    final categoryId = await _categoryId(params: params);
    final descriptionId = await _descriptionId(params: params);

    final entity = TransactionEntity(
        userId: _userId,
        categoryId: categoryId,
        descriptionId: descriptionId,
        value: params.value,
        date: params.date,
        type: params.type);

    final docRef = await _collection.add(entity.toJson());

    return TransactionModel.fromEntity(entity..id = docRef.id);
  }

  Future<String> _categoryId({required CreateTransactionParams params}) async {
    return params.categoryId ??
        await _categoryRepository.register(
            params: CreateCategoryParams(
                category: params.category!, type: params.type));
  }

  Future<String> _descriptionId(
      {required CreateTransactionParams params}) async {
    return params.descriptionId ??
        await _descriptionRepository.register(
            params: CreateDescriptionParams(
                description: params.description!, type: params.type));
  }
}