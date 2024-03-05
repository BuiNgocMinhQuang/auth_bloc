part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String shopId;
  final String email;
  final String password;

  LoginButtonPressed({
    required this.shopId,
    required this.email,
    required this.password,
  });
}
