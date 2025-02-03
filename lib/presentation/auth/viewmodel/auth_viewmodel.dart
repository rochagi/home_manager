import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthBloc authBloc;

  AuthViewModel(this.authBloc);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() {
    authBloc.add(AuthSignIn(email: emailController.text, password: passwordController.text));
  }
}
