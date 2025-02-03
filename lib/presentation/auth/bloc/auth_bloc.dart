import 'package:bloc/bloc.dart';
import 'package:home_manager/domain/models/user_model.dart';
import 'package:home_manager/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthSignIn>((event, emit) async {
     emit(AuthLoading());
     try {
      final user = await _authRepository.singIn(event.email, event.password);
      if (user != null){
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthError('Usuário ou senha inválidos'));
      }
     } catch (e) {
      emit(AuthError(e.toString()));
       
     }
    });
  }
}
