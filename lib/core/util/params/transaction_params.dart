import '../enums.dart';

class GetByTransactionTypeParams {
  final TransactionType type;

  const GetByTransactionTypeParams({required this.type});
}

class CreateTransactionParams {
  final String category, description;
  final int value;
  final DateTime date;
  TransactionType? type;

  CreateTransactionParams(
      {required this.category,
      required this.description,
      required this.value,
      required this.date,
      this.type});
}
