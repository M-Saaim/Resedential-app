// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Advoting extends StatefulWidget {
  const Advoting({Key? key}) : super(key: key);

  @override
  State<Advoting> createState() => _AdvotingState();
}

class _AdvotingState extends State<Advoting> {
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
                  MaterialPageRoute(builder: (context) => const Adhome()));
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text("Admin-Voting"),
        backgroundColor: const Color.fromARGB(255, 170, 37, 0),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.bottomRight,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 6),
            color: const Color.fromARGB(
              255,
              170,
              37,
              0,
            ),
            shape: BoxShape.circle,
          ),
          child: IconButton(
              // style: const ButtonStyle(backgroundColor: Colors.purple),
              iconSize: 50,
              // color: Colors.blue,
              highlightColor: Colors.black,
              icon: const Icon(
                Icons.add_chart,
                color: Colors.white,
              ),
              onPressed: () {
                print('Hi There');
              }),
        ),
      ),
    ));
  }
}
