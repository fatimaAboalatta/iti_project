import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iti/HomeScreen.dart';
import 'package:project_iti/Onboarding_Screen/login.dart';
class Auth extends StatelessWidget { const Auth({super.key});
@override
Widget build (BuildContext context) {
  return Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), builder: ((context, snapshot) {
      if (snapshot.hasData) {
        return HomeScreen();
      } else {
      return Login();
      }
    }),
    ), // StreamBuilder
  ); // Scaffold
}
}