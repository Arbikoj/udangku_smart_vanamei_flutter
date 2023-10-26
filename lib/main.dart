import 'package:flutter/material.dart';
import 'package:udg/screens/signin_screen.dart';
import 'package:udg/auth/login.dart';
import 'package:udg/dashboard/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:udg/welcome.dart';
import 'package:udg/onboarding/onboarding_screen.dart';

import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:udg/dashboard/dashboard.dart';

final user = FirebaseAuth.instance.currentUser;
Future<void> main() async {
  //getX

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(const MyApp());
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
        // home: Welcome(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: OnboardingScreen(),
        home: Dashboard(),
      );
    }
  }
}
