import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/Screens/auth/login_screen.dart';
import 'package:grad_project/Screens/auth/register_screen.dart';
import 'package:grad_project/Screens/set_password.dart';
import 'package:grad_project/Screens/splash_screen.dart';
import 'package:grad_project/Screens/welcome_screen.dart';
import 'package:grad_project/firebase_options.dart';

import 'Screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SetPassword.routeName: (context) => const SetPassword(),
      },
      home:  HomeScreen(),
    );
  }
}
