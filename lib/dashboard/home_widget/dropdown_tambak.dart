import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

const List<String> listTambak = <String>['Tambak 1', 'Tambak 2'];
String? _selectedTambak;

class DropdownTambak extends StatefulWidget {
  const DropdownTambak({super.key});

  @override
  State<DropdownTambak> createState() => _DropdownTambakState();
}

class _DropdownTambakState extends State<DropdownTambak> {
  String dropdownValue = listTambak.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            height: 28,
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8)),
            child: DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              underline: Container(),
              // set the color of the dropdown menu
              dropdownColor: Colors.amber,
              icon: const Icon(
                Icons.arrow_downward,
                color: Color(0xFF949191),
              ),
              isExpanded: true,
              // The list of options
              items: listTambak
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ))
                  .toList(),
              // Customize the selected item
              selectedItemBuilder: (BuildContext context) => listTambak
                  .map((e) => Center(
                        child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF949191),
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
