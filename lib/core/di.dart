import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_manager/domain/repositories/auth_repository_impl.dart';
import 'package:home_manager/presentation/auth/bloc/auth_bloc.dart';
import 'package:home_manager/presentation/auth/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../domain/repositories/auth_repository.dart';



List<SingleChildWidget> providers = [
  Provider<FirebaseAuth>(create: (_) => FirebaseAuth.instance),
  Provider<AuthRepository>(
    create: (context) => AuthRepositoryImpl(firebaseAuth: context.read<FirebaseAuth>()),
  ),
  ProxyProvider<AuthRepository, AuthBloc>(
    update: (_, authRepo, __) => AuthBloc(authRepo),
  ),
  ChangeNotifierProvider<AuthViewModel>(
    create: (context) => AuthViewModel(context.read<AuthBloc>()),
  ),
];
