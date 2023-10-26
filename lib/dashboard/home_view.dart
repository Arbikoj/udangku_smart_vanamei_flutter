import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:udg/dashboard/home_widget/dropdown_tambak.dart';
import 'package:udg/onboarding/size_config.dart';
import 'package:get/get.dart';
import 'package:floating_pullup_card/floating_pullup_card.dart';
import 'package:udg/onboarding/size_config.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  /*
  // SETTING FIREBASE
  */

  double dataInt = 0;
  double intDO = 0;
  double intTEMP = 0;

  late DatabaseReference _dbref;
  String databasejson = "";
  String countvalue = "";
  String dataDO = "";
  String countku = "";
  String datafinal = "";
  String datafinalDO = "";
  String countDO = "";
  String dataTEMP = "";
  String countTEMP = "";

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
    _dbref.child("sensor").child("adc").onValue.listen((event) {
      print("sensor value " + event.snapshot.value.toString());

      setState(() {
        countvalue = event.snapshot.value.toString();
        countku = countvalue;
        dataInt = double.parse(countku);
        dataInt = dataInt / 100;
        datafinal = "$dataInt";
      });
    });

    // data DO
    _dbref.child("sensor").child("do").onValue.listen((event) {
      print("sensor value " + event.snapshot.value.toString());

      setState(() {
        dataDO = event.snapshot.value.toString();

        countDO = dataDO;
        intDO = double.parse(countDO);
        datafinalDO = "$intDO";
      });
    });

    // temperature
    _dbref.child("sensor").child("temp").onValue.listen((event) {
      print("sensor value " + event.snapshot.value.toString());

      setState(() {
        dataTEMP = event.snapshot.value.toString();
        countTEMP = dataTEMP;
        intTEMP = double.parse(countTEMP);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // FIX
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Tambak :'),
          Text('database = ' + datafinal),
          DropdownTambak(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardData(
                  title: "Dissolved Oxygen (DO)",
                  data: "$intDO",
                  satuan: " mg/l",
                  status: true),
              cardData(
                  title: "Temperature",
                  data: "$intTEMP",
                  satuan: " °C",
                  status: false),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              cardData(
                  title: "pH (keasaman)",
                  data: "7.4",
                  satuan: "",
                  status: false),
              cardData(
                  title: "Salinitas",
                  data: "100",
                  satuan: " ppm",
                  status: true),
            ],
          ),

          // last
        ],
      ),
    );
  }
}

class cardData extends StatelessWidget {
  const cardData({
    Key? key,
    required this.title,
    required this.data,
    required this.satuan,
    required this.status,
  }) : super(key: key);

  final String title;
  final String data;
  final String satuan;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black,
      color: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        width: Get.width * 0.40,
        height: 150,
        child: Column(
          children: [
            Text(
              title,
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  text: data,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: satuan, style: TextStyle(fontSize: 18)),
                  ]),
            ),
            SizedBox(height: 10),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'kondisi',
                  style: TextStyle(
                      color: Color(0xFF545050), fontWeight: FontWeight.w300),
                ),
                Card(
                  color: status == true ? Color(0xFF7AEA68) : Color(0xFFD6DA1C),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: Get.width * 0.25,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text((status == true ? "Bagus" : "Buruk"),
                            style: TextStyle(
                                color: (status == true
                                    ? Color(0xFF114D07)
                                    : Color(0xFF656D08)),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
