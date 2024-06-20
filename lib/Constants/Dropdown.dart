import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  '- KG',
  '1 KG',
  '5 KG',
  '7 KG',
  '10 KG',
  '15 KG',
  '20 KG',
  '30 KG',
  '40 KG',
  '50 KG'
];

const List<String> categ = <String>[
  'Grocery',
  'Pharma',
  'Fashion Clothes',
  'Flowers',
  'Gifts',
  'Tiffin',
  'Offices',
  'Others'
];
String dropdownValue = "1 KG";
String dropdownValue1 = categ.first;

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key, Key? Key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  Widget build(BuildContext context) {
    SP_weight = "1 KG";
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
      style: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey),
      onChanged: (String? value) {
        if (value != null) {
          // Check for null before accessing value
          setState(() {
            dropdownValue = value;
            SP_weight = value;
          });
        }
      },
      hint: const Text("Select Weight"),
      borderRadius: BorderRadius.circular(20),
      menuMaxHeight: 200,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}

class catdrop extends StatefulWidget {
  const catdrop({super.key});

  @override
  State<catdrop> createState() => _catdropState();
}

class _catdropState extends State<catdrop> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue1,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
      style: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey),
      onChanged: (String? value) {
        if (value != null) {
          // Check for null before accessing value
          setState(() {
            dropdownValue1 = value;
            SP_category = value;
          });
        }
      },
      hint: const Text("Select Category"),
      borderRadius: BorderRadius.circular(20),
      menuMaxHeight: 200,
      items: categ.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}
