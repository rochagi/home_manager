import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap(Future<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(await builder());
}
