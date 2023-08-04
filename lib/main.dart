import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_iti/Onboarding_Screen/login.dart';
import 'package:project_iti/Onboarding_Screen/Onboarding_Screen2.dart';
import 'package:project_iti/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool show = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show=prefs.getBool ('ON_BOARDING') ?? true;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: show ? Onbordingscreen() : Auth(),
      debugShowCheckedModeBanner:false,
      theme: ThemeData(fontFamily:"Cairo"),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
      ],
    );
  }
}
