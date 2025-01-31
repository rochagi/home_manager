import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_manager/domain/models/user_model.dart';
import 'package:home_manager/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  @override
  Future<UserModel?> singIn(String email, String password) async {

try {
  final userCredencial = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  final user = userCredencial.user;
  if (user != null){
    return UserModel(id: user.uid, email: user.email ?? '');
  }
} catch (e) {
  throw Exception("Erro ao fazer login: $e");
  
}
return null;
  }

  @override
  Future<UserModel?> singUp(String email, String password) async {
  try {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    if (user != null){
      return UserModel(id: user.uid, email: user.email ?? '');
    }
  } catch (e) {
    
  }
  }

  @override
  Future<void> singOut() async {
  await _firebaseAuth.signOut();
  }


  
  @override
  Future<UserModel?> getCurrentUser() async {
   final user = _firebaseAuth.currentUser;
   if(user != null){
    return UserModel(id: user.uid, email: user.email ?? '');
   }
   return null;
  }
}