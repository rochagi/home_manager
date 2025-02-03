part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


final class AuthSignIn extends AuthEvent{
  final String email;
  final String password;

  AuthSignIn({required this.email, required this.password});
  
}

final class AuthSingUp extends AuthEvent {
  final String email;
  final String password;

  AuthSingUp({required this.email, required this.password});

}

final class AuthSignOut extends AuthEvent{}