import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard/home_view.dart';
import '../dashboard/control_view.dart';
import '../dashboard/data_view.dart';
import '../dashboard/profile_view.dart';
import '../dashboard/profile_viewNew.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // firebase

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ControlView(),
    // DataView(),
    ProfileNew()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bold = FontWeight.w900;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // ignore: prefer_const_literals_to_create_immutables
          colors: [
            Color.fromARGB(255, 244, 248, 47),
            Color.fromARGB(255, 16, 165, 249),
          ],
        )),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'U&G',
                        style: TextStyle(fontSize: 20, fontWeight: bold),
                      ),
                      const Spacer(),
                      Icon(Icons.message),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[100],
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Control", icon: Icon(Icons.control_point_duplicate)),
          // BottomNavigationBarItem(label: "Data", icon: Icon(Icons.analytics)),
          BottomNavigationBarItem(
              label: "Profile", icon: Icon(Icons.account_circle)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
