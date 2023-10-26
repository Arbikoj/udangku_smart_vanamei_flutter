import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:udg/dashboard/home_widget/dropdown_tambak.dart';
import 'package:get/get.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class ControlView extends StatefulWidget {
  const ControlView({super.key});

  @override
  State<ControlView> createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  late DatabaseReference _dbref;

  int value = 0;
  late bool semuaKincir = false;
  late bool kincirSatu = false;
  late bool kincirDua = false;

  String allkincir = "";
  String satukincir = "";
  String duakincir = "";
  int ak = 0;
  int sk = 0;
  int dk = 0;

  DatabaseReference refAll = FirebaseDatabase.instance.ref("kincir/all");
  DatabaseReference refSatu = FirebaseDatabase.instance.ref("kincir/satu");
  DatabaseReference refDua = FirebaseDatabase.instance.ref("kincir/dua");

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
    _dbref.child("kincir").child("all/semuaKincir").onValue.listen((event) {
      print("kincir all " + event.snapshot.value.toString());

      setState(() {
        allkincir = event.snapshot.value.toString();
        // ak =
        // if (allkincir = "1") {}
        // countku = countvalue;
        // dataInt = double.parse(countku);
        // dataInt = dataInt / 100;
        // datafinal = "$dataInt";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Tambak :'),
          DropdownTambak(),
          Card(
            color: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
              padding: EdgeInsets.all(3),
              width: Get.width * 1,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text('Semua kincir'),
                      ),
                      AnimatedToggleSwitch<bool>.dual(
                        current: semuaKincir,
                        first: false,
                        second: true,
                        dif: 50.0,
                        borderColor: Colors.transparent,
                        borderWidth: 5.0,
                        height: 53,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(1.5, 1.5),
                          ),
                        ],
                        onChanged: (b) => setState(() {
                          semuaKincir = b;
                          if (semuaKincir) {
                            refAll.set({
                              "semuaKincir": 0,
                            });
                          } else {
                            refAll.set({
                              "semuaKincir": 1,
                            });
                          }
                          ;
                        }),
                        colorBuilder: (b) => b ? Colors.red : Colors.green,
                        iconBuilder: (value) => value
                            ? Icon(Icons.mode_fan_off)
                            : Icon(Icons.cyclone),
                        textBuilder: (value) => value
                            ? Center(child: Text('Mati'))
                            : Center(child: Text('Nyala')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
              padding: EdgeInsets.all(2),
              width: Get.width * 1,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text('Kincir 1'),
                      ),
                      AnimatedToggleSwitch<bool>.dual(
                        current: kincirSatu,
                        first: false,
                        second: true,
                        dif: 50.0,
                        borderColor: Colors.transparent,
                        borderWidth: 5.0,
                        height: 55,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1.5),
                          ),
                        ],
                        onChanged: (b) => setState(() {
                          kincirSatu = b;
                          if (kincirSatu) {
                            refSatu.set({
                              "kincirSatu": 0,
                            });
                          } else {
                            refSatu.set({
                              "kincirSatu": 1,
                            });
                          }
                          ;
                        }),
                        colorBuilder: (b) => b ? Colors.red : Colors.green,
                        iconBuilder: (value) => value
                            ? Icon(Icons.mode_fan_off)
                            : Icon(Icons.cyclone),
                        textBuilder: (value) => value
                            ? Center(child: Text('Mati'))
                            : Center(child: Text('Nyala')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
              padding: EdgeInsets.all(2),
              width: Get.width * 1,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text('Kincir 2'),
                      ),
                      AnimatedToggleSwitch<bool>.dual(
                        current: kincirDua,
                        first: false,
                        second: true,
                        dif: 50.0,
                        borderColor: Colors.transparent,
                        borderWidth: 5.0,
                        height: 55,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1.5),
                          ),
                        ],
                        onChanged: (b) => setState(() {
                          kincirDua = b;
                          if (kincirDua) {
                            refDua.set({
                              "kincirDua": 0,
                            });
                          } else {
                            refDua.set({
                              "kincirDua": 1,
                            });
                          }
                          ;
                        }),
                        colorBuilder: (b) => b ? Colors.red : Colors.green,
                        iconBuilder: (value) => value
                            ? Icon(Icons.mode_fan_off)
                            : Icon(Icons.cyclone),
                        textBuilder: (value) => value
                            ? Center(child: Text('Mati'))
                            : Center(child: Text('Nyala')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
