part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthenticationSuccess extends LoginState {
  final String token;

  const AuthenticationSuccess(this.token);

  @override
  List<Object> get props => [token];
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
  @override
  List<Object> get props => [message];
}
