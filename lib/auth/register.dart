import 'package:flutter/material.dart';
import 'package:udg/onboarding/size_config.dart';
import 'package:udg/auth/register.dart';
import 'package:udg/reusable_widgets/reusable_widget.dart';
import 'package:udg/screens/home_screen.dart';
import 'package:udg/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:udg/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:udg/auth/login.dart';
import 'package:udg/dashboard/dashboard.dart';
import 'dart:math';

import 'package:udg/dashboard/home.dart';
// Import the firebase_core and cloud_firestore plugin

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<Register> {
  // generate token
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String confirmPassword;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void logout() {
    _auth.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        toolbarHeight: 45,
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
            color: Color.fromARGB(191, 0, 0, 0),
          ),
        ),
        backgroundColor: Colors.grey[200],
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Hi, Welcome!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Let's create your account",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.4)),
            ),
            const SizedBox(
              height: 20,
            ),
            reusableTextField(
                "Nama Depan", Icons.person_outline, false, firstNameController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Nama Belakang", Icons.person_outline, false,
                lastNameController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField(
                "Email", Icons.person_outline, false, emailController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Enter Password", Icons.lock_outlined, true,
                passwordController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Enter Password", Icons.lock_outlined, true,
                confirmPasswordController),
            const SizedBox(
              height: 20,
            ),
            firebaseUIButton(
              context,
              "Sign Up",
              () {
                final namaDepan = firstNameController.text;
                final namaBlg = lastNameController.text;
                final email = emailController.text;
                final pass = passwordController.text;
                final confirmPass = confirmPasswordController.text;

                createUser(
                  pNamaDepan: namaDepan,
                  pNamaBlg: namaBlg,
                  pEmail: email,
                  pPass: pass,
                  pConfirmPass: confirmPass,
                );

                createToken(tokenID: getRandomString(10), emailParsing: email);
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text)
                    .then((value) {
                  print("Created New Account");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sudah memiliki akun? silahkan '),
                TextButton(
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

void createUser(
    {required String pNamaDepan,
    required String pNamaBlg,
    required String pEmail,
    required String pPass,
    required String pConfirmPass}) async {
// get data
  final docUser = FirebaseFirestore.instance.collection('users').doc(pEmail);
  return docUser
      .set({
        'pNamaDepan': pNamaDepan,
        'pNamaBlg': pNamaBlg,
        'pEmail': pEmail,
        'pPass': pPass,
        'pConfirmPass': pConfirmPass,
      })
      .then((value) => print("user added"))
      .catchError((error) => print("Failed to add user: $error"));
}

void createToken(
    {required String tokenID, required String emailParsing}) async {
// get data
  final docToken =
      FirebaseFirestore.instance.collection('token').doc(emailParsing);
  return docToken
      .set({'tokenId': tokenID})
      .then((value) => print("token added"))
      .catchError((error) => print("Failed to add user: $error"));
}
