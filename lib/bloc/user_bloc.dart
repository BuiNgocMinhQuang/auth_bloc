// bloc/user_bloc.dart
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logic_bloc/model/user.dart';
import 'package:logic_bloc/utils/shared_per.dart';
import 'package:http/http.dart' as http;

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserEvent>(_onGetUser);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onGetUser(GetUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final token = await SharedPreferencesHelper.getToken();

    if (token != null) {
      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(
        Uri.parse(
            'https://shop.layoutwebdemo.com/api/staff/login'), // Replace with your API endpoint
        headers: headers,
      );

      // if (response.statusCode == 200) {

      //   final data = jsonDecode(response.body);

      //   if (data['status'] == 200) {
      //     print(" DATA $data");
      //     final user = User.fromJson(data);
      //     print("USER DATA $user");
      //     emit(UserLoaded(user));
      //   } else {
      //     emit(UserUnauthenticated());
      //   }
      // } else {
      //   emit(UserUnauthenticated());
      // }
    } else {
      emit(UserUnauthenticated());
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<UserState> emit) async {
    await SharedPreferencesHelper.removeToken();
    emit(UserUnauthenticated());
  }
}

// user_event.dart (within user_bloc.dart)
class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class LogoutEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

// user_state.dart (within user_bloc.dart)
class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserUnauthenticated extends UserState {
  @override
  List<Object> get props => [];
}

class UserFailure extends UserState {
  final String message;

  UserFailure(this.message);

  @override
  List<Object> get props => [message];
}
