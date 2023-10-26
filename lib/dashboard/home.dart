import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class dHome extends GetView<HomeController> {
  // const dHome({Key? key}) : super(key: key);
  int _selectedIndex = 0;

  // initialisasi home controller
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var bold = FontWeight.bold;

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
              padding: EdgeInsets.all(20),
              child: Column(
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
                ],
              ),
            ),
            Container(
              child: Obx(() =>
                  controller.myWidgets.elementAt(controller.indexWidget.value)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[100],
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          // icon: (controller.indexWidget.value == 2)
          //     ? Image.asset("assets/icons/home-activate.png")
          //     : Image.asset("assets/icons/home.png")),
          BottomNavigationBarItem(
              label: "Control",
              icon: Image.asset("assets/icons/control-activate.png")),
          BottomNavigationBarItem(
              label: "Data",
              icon: Image.asset("assets/icons/data-activate.png")),
          BottomNavigationBarItem(
              label: "Profile",
              icon: Image.asset("assets/icons/profile-activate.png")),
        ],
        currentIndex: controller.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (value) => controller.changeIndexBottomNav(value),
      ),
    );
  }
}

class ItemNav extends StatelessWidget {
  ItemNav({
    Key? key,
    required this.icon,
    required this.title,
    required this.status,
    required this.onPressed,
  }) : super(key: key);

  final bool status;
  final String title;
  final String icon;
  final int onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // FlatButton(
        //   onPressed: () {
        //     (onPressed == 2) ? status == true : status == false;
        //   },
        //   child: Container(
        //     height: 40,
        //     child: Image.asset((status == true)
        //         ? "assets/icons/$icon-activate.png"
        //         : "assets/icons/$icon.png"),
        //   ),
        // ),
        Text(
          title,
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight:
                  (status == true) ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }
}
