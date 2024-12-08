part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserModel user;
  final message = 'Registro exitoso!';

  const SignUpSuccess(this.user);
}

final class SignUpFailure extends SignUpState {
  final String error;

  const SignUpFailure(this.error);
}
