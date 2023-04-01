// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';

class Adnotice extends StatefulWidget {
  const Adnotice({Key? key}) : super(key: key);

  @override
  State<Adnotice> createState() => _AdnoticeState();
}

class _AdnoticeState extends State<Adnotice> {
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
                            builder: (context) => const Adhome()));
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
              title: const Text("Admin-Notice"),
              backgroundColor: const Color.fromARGB(255, 170, 37, 0),
              centerTitle: true,
            ),
            body: Container(
              alignment: Alignment.bottomCenter,
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
                      Icons.add_box_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print('Hi There');
                    }),
              ),
            )));
  }
}
