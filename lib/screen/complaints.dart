// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:resedentialapp/screen/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  get textStyle => const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePAge()));
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text("Complaints"),
        backgroundColor: const Color.fromARGB(255, 170, 37, 0),
        centerTitle: true,
      ),
    ));
  }
}
