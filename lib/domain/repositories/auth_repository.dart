import 'package:home_manager/domain/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> singIn(String email, String password);
  Future<UserModel?> singUp(String email, String password);
  Future<void> singOut();
  Future<UserModel?> getCurrentUser();

}