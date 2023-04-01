// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/homepage.dart';

class Advisitors extends StatefulWidget {
  const Advisitors({Key? key}) : super(key: key);

  @override
  State<Advisitors> createState() => _AdvisitorsState();
}

class _AdvisitorsState extends State<Advisitors> {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePAge()));
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
              title: const Text("Admin-Notice"),
              backgroundColor: const Color.fromARGB(255, 170, 37, 0),
              centerTitle: true,
            ),
            body: Builder(builder: (context) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  ));
            })));
  }
}
