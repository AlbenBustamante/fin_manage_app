import 'package:finmanageapp/core/api/api_collections.dart';
import 'package:finmanageapp/core/util/params/description_params.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/features/home/domain/entities/description_entity.dart';
import 'package:finmanageapp/features/home/domain/repositories/description_repository.dart';

class DescriptionRepositoryImpl implements DescriptionRepository {
  final String _userId;
  final _collection = ApiCollections.descriptions;

  DescriptionRepositoryImpl(this._userId);

  @override
  Future<List<DescriptionModel>> fetchAllByType(
      {required GetByTransactionTypeParams params}) async {
    final snapshot = await _collection
        .where('userId', isEqualTo: _userId)
        .where('type', isEqualTo: params.type)
        .get();

    final List<DescriptionModel> descriptions = [];

    if (snapshot.docs.isNotEmpty) {
      for (final doc in snapshot.docs) {
        final entity = DescriptionEntity.fromDocument(doc);
        descriptions.add(DescriptionModel.fromEntity(entity));
      }
    }

    return descriptions;
  }

  @override
  Future<DescriptionModel> register(
      {required CreateDescriptionParams params}) async {
    final snapshot = await _collection
        .where('userId', isEqualTo: _userId)
        .where('text', isEqualTo: params.description)
        .where('type', isEqualTo: params.type)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final entity = DescriptionEntity.fromDocument(snapshot.docs.first);
      return DescriptionModel.fromEntity(entity);
    }

    final entity = DescriptionEntity.fromParams(_userId, params);

    final docRef = await _collection.add(entity.toJson());

    return DescriptionModel.fromEntity(entity)..id = docRef.id;
  }
}