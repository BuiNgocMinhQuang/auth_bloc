import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logic_bloc/bloc/login_bloc.dart';
import 'package:logic_bloc/page/login_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => _loginBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Đăng nhập"),
        ),
        body: LoginForm(),
      ),
    );
  }
}
