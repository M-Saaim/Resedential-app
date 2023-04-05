// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resedentialapp/screen/admin/advoting.dart';

class Addvoter extends StatefulWidget {
  const Addvoter({Key? key}) : super(key: key);

  @override
  State<Addvoter> createState() => _AddvoterState();
}

class _AddvoterState extends State<Addvoter> {
  late String votername;
  late String position;
  late String email;
  late String userid;

  @override
  void initState() {
    final auth = FirebaseAuth.instance;
    dynamic user = auth.currentUser;
    email = user.email;

    userid = user.uid;

    super.initState();
  }

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
                            builder: (context) => const Advoting()));
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
              title: const Text("Add-Voting"),
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
                    child: Column(children: [
                      TextField(
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          votername = value;
                          //Do something with the user input.
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hoverColor: const Color.fromRGBO(97, 167, 238, 0.684),
                          fillColor: Colors.black12,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(9)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple.shade400,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(9)),
                          hintText: "Voter's Name",
                          alignLabelWithHint: true,
                          label: const Icon(
                            Icons.person_add,
                            color: Color.fromARGB(255, 170, 0, 0),
                          ),
                        ),
                        maxLines: 5,
                        minLines: 1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextField(
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          position = value;
                          //Do something with the user input.
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hoverColor: const Color.fromRGBO(97, 167, 238, 0.684),
                          fillColor: Colors.black12,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(9)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple.shade400,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(9)),
                          hintText: "Position",
                          alignLabelWithHint: true,
                          label: const Icon(
                            Icons.person_4,
                            color: Color.fromARGB(255, 170, 0, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Map<String, String> datatoSave = {
                            "Voter's Name": votername,
                            'Position': position,
                            'user uid': userid,
                          };

                          FirebaseFirestore.instance
                              .collection('Voting')
                              .doc(email)
                              .set(datatoSave);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Advoting()));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            backgroundColor:
                                const Color.fromARGB(255, 170, 0, 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: Column(
                          children: [
                            Text(
                              "Add",
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 1.3,
                                      fontWeight: FontWeight.w800)),
                            ),
                            Text(
                              "Voter",
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 1.3,
                                      fontWeight: FontWeight.w800)),
                            ),
                          ],
                        ),
                      ),
                    ])),
              );
            })));
  }
}
