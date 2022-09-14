import 'package:exemplo/app/app_modules.dart';
import 'package:exemplo/app/app_widget.dart';
import 'package:exemplo/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter_modular/flutter_modular.dart';

void runAppModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ModularApp(module: AppModule(), child: const MyAppWidget()));
  // runApp(const MyApp());
}
