part of 'incomes_bloc.dart';

sealed class IncomesState extends Equatable {
  const IncomesState();

  @override
  List<Object> get props => [];
}

final class IncomesInitial extends IncomesState {}

final class FetchLoading extends IncomesState {}

final class FetchSuccess extends IncomesState {
  final List<CategoryModel> categories;
  final List<DescriptionModel> descriptions;

  const FetchSuccess(this.categories, this.descriptions);

  @override
  List<Object> get props => [categories, descriptions];
}

final class FetchFailure extends IncomesState {
  final String error;

  const FetchFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class SubmitLoading extends IncomesState {}

final class SubmitSuccess extends IncomesState {
  final TransactionModel transaction;

  const SubmitSuccess(this.transaction);
}

final class SubmitFailure extends IncomesState {
  final String error;

  const SubmitFailure(this.error);
}
