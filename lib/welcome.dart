// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:udg/onboarding/size_config.dart';
import 'package:udg/auth/login.dart';
import 'package:udg/auth/register.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    var welcome = const Text(
      'Welcome to U&G',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 27,
      ),
    );
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 140),
              welcome,
              SizedBox(height: (height >= 840) ? 50 : 30),
              Image.asset(
                "./images/welcome.png",
                height: SizeConfig.blockV! * 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: (height >= 840) ? 45 : 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Color.fromARGB(191, 255, 255, 255),
                    backgroundColor:
                        Color.fromARGB(255, 21, 169, 233), // Text Color
                    padding: EdgeInsets.only(left: 90, right: 90),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: Text("LOGIN", style: TextStyle(fontSize: 18)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Color.fromARGB(191, 17, 52, 121),
                    backgroundColor:
                        Color.fromARGB(102, 21, 169, 233), // Text Color
                    padding: EdgeInsets.only(left: 90, right: 90),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: Text("REGISTER", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          )),
        ));
  }
}
