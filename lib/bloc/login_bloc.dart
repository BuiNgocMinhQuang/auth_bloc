// import 'dart:async';
// import 'dart:convert';

// import 'package:bloc/bloc.dart';
// import 'package:http/http.dart' as http;

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitial()) {
//     on<LoginButtonPressed>((event, emit) async {
//       print("1111111LLL");

//       await loginUser(emit, event);
//     });
//   }

//   loginUser(Emitter<LoginState> emit, LoginButtonPressed event) async* {
//     // emit(LoginLoading());
//     print("ALALLL");
//     try {
//       final response = await http.post(
//         Uri.parse('https://shop.layoutwebdemo.com/api/staff/login'),
//         body: {
//           'shop_id': event.shopId,
//           'email': event.email,
//           'password': event.password,
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         if (data['success']) {
//           yield LoginSuccess();
//         } else {
//           yield LoginFailure(data['message']);
//         }
//       } else {
//         yield LoginFailure('Lỗi kết nối');
//       }
//     } catch (error) {
//       yield LoginFailure(error.toString());
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    on<LoginButtonPressed>((event, emit) async* {
      yield LoginLoading();

      try {
        final response = await http.post(
          Uri.parse('https://shop.layoutwebdemo.com/api/staff/login'),
          body: {
            'shop_id': event.shopId,
            'email': event.email,
            'password': event.password,
          },
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['success']) {
            yield LoginSuccess();
          } else {
            yield LoginFailure(data['message']);
          }
        } else {
          yield LoginFailure('Lỗi kết nối');
        }
      } catch (error) {
        yield LoginFailure(error.toString());
      }
    });
  }
}
