
// test the edits in github goooooooooooooooooooooooooo
// the second for this file onlyyyyyyyyyyyyyyyy


// edit in new branch to test -------------

import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:project_2/firebase_options.dart';

import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'create_account_screen.dart'; // Import the AuthScreen
import 'forgotpassword.dart';
import 'otp_screen.dart';
import 'change_password.dart';
import 'home.dart'; // Import HomeScreen
import 'market.dart'; // Import the MarketChooserScreen

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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/createAccount': (context) => const AuthScreen(),
        '/forgotPassword': (context) => const forgotpassword(),
        '/otp': (context) => const otp_screen(email: ''),
        '/changePassword': (context) => const change_password(),
        '/home': (context) => const home(), // Add HomeScreen to routes
        '/markets': (context) => const market(), // Add MarketChooserScreen to routes
      },
    );
  }
}