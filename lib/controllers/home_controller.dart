import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../dashboard/home_view.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;
  RxInt indexWidget = 0.obs;
  void changeIndexBottomNav(int index) {
    indexWidget.value = index;
    selectedIndex = index;
  }

  List<Widget> myWidgets = [
    HomeView(),
    Center(
      child: Text(
        'Control',
        style: TextStyle(fontSize: 30),
      ),
    ),
    Center(
      child: Text(
        'Data',
        style: TextStyle(fontSize: 30),
      ),
    ),
    Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 30),
      ),
    ),
  ];
}
