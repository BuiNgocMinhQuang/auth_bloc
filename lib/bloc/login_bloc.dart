import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:logic_bloc/model/user.dart';
import 'package:logic_bloc/utils/shared_per.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final response = await http.post(
        Uri.parse('https://shop.layoutwebdemo.com/api/staff/login'),
        body: {
          'shop_id': event.shopId,
          'email': event.email,
          'password': event.password,
        },
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data['status'] == 200) {
          final token = data['token'];
          print("DATA Token ${token}");
          final user = User.fromJson(data);
          print("DATA USER ${user}");
          await SharedPreferencesHelper.saveToken(token);
          emit(LoginSuccess(user));
        } else {
          emit(LoginFailure(data['message']));
        }
      } else {
        emit(LoginFailure(data.errors));
      }
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}

Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<void> removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
}
