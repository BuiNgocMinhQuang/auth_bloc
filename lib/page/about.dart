// screens/user_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _userBloc = UserBloc();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => _userBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thông tin người dùng'),
        ),
        body: UserScreen(),
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          final user = state.user;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text('Tên:', style: TextStyle(fontSize: 18.0)),
                Text(user.data.staffFullName),
                SizedBox(height: 8.0),
                Text('Email:', style: TextStyle(fontSize: 18.0)),
                Text(user.data.staffEmail),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<UserBloc>(context).add(LogoutEvent());
                  },
                  child: Text('Đăng xuất'),
                ),
              ],
            ),
          );
        } else if (state is UserUnauthenticated) {
          return Center(
            child: Text('Bạn chưa đăng nhập'),
          );
        } else {
          return Center(child: Text('Lỗi'));
        }
      },
    );
  }
}
