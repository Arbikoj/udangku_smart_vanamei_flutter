import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udg/welcome.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  final String name = "";
  final String documentId = "";

  @override
  Widget build(BuildContext context) {
    late DocumentSnapshot snapshot;

    void getData() async {
      //use a Async-await function to get the data
      final data = await FirebaseFirestore.instance
          .collection("users")
          .doc('0kdt1UET7K7qwuT4Kcae')
          .get(); //get the data
      snapshot = data;
    }

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final docRef = FirebaseFirestore.instance
        .collection("users")
        .doc("0kdt1UET7K7qwuT4Kcae");

    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        name:
        data['pNamaDepan'];
      },
      onError: (e) => print("Error getting document: $e"),
    );
    getData();
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
            'nama',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            "arbi@gmail.com",
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
