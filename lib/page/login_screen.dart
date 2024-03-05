import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logic_bloc/bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _shopIdController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              // Input shop_id
              TextFormField(
                controller: _shopIdController,
                decoration: const InputDecoration(labelText: "Shop ID"),
              ),

              // Input email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),

              // Input password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Mật khẩu"),
              ),

              // Button đăng nhập
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<LoginBloc>(context).add(
                      LoginButtonPressed(
                        shopId: _shopIdController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  }
                },
                child: const Text("Đăng nhập"),
              ),

              // Hiển thị trạng thái đăng nhập
              if (state is LoginLoading) const CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
