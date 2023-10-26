import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udg/welcome.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileNew extends StatefulWidget {
  const ProfileNew({super.key});

  @override
  State<ProfileNew> createState() => _ProfileNewState();
}

class _ProfileNewState extends State<ProfileNew> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late DatabaseReference _dbref;
  String databasejson = "";
  String countvalue = "";
  late final data;
  String getDepan = "";
  String getBlg = "";
  String getEmail = "";

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
    _dbref.child("sensor").child("adc").onValue.listen((event) {
      print("sensor value " + event.snapshot.value.toString());

      setState(() {
        countvalue = event.snapshot.value.toString();
      });
    });

    FirebaseFirestore.instance
        .collection("users")
        .doc('0kdt1UET7K7qwuT4Kcae')
        .get()
        .then(
      (DocumentSnapshot doc) {
        data = doc.data() as Map<String, dynamic>;
        setState(() {
          print(data);
          getBlg = data['pNamaBlg'];
          getDepan = data['pNamaDepan'];
          getEmail = data['pEmail'];
          // generateRandomString(10);
          // print(getRandomString(15));

          // final User user = auth.currentUser;
          // final uid = user.uid;
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Color.fromARGB(0, 189, 39, 39),
      child: Column(
        children: [
          SizedBox(height: 5),
          Image.asset(
            "./images/akun.png",
            height: 80,
            scale: 2.5,
          ),
          const SizedBox(height: 15),

          Text(
            getDepan + " " + getBlg,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            getEmail,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('Ubah Profile')),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              print('tapp');
            },
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [Icon(Icons.settings), Text('Setting')],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )),
          ),
          GestureDetector(
            onTap: () {
              print('tapp');
            },
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.smart_display),
                      Text('Tutorial Aplikasi')
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )),
          ),
          GestureDetector(
            onTap: () {
              print('tapp');
            },
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [Icon(Icons.stars), Text('Berikan Rating')],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )),
          ),
          GestureDetector(
            onTap: () {
              print('tapp');
            },
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [Icon(Icons.info), Text('Info Aplikasi')],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )),
          ),

          // logout
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              print('logout');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Welcome()));
            },
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      Text(
                        'Keluar',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
