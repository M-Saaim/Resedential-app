// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/homepage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String name;
  late String email;
  late String phone;
  late String house;
  late String address;
  late String userid;

  late Radius topLeft;

  get textStyle => const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  @override
  void initState() {
    final auth = FirebaseAuth.instance;
    // CollectionReference users = FirebaseFirestore.instance.collection("Users");
    dynamic user = auth.currentUser;
    // name = users.,
    // email = user.email;
    // phone = user.phone;
    // house = user.house;
    // address = user.address;
    userid = user.uid;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
    //     stream: FirebaseFirestore.instance
    //         .collection("Users")
    //         .doc(email)
    //         .snapshots(),
    //     builder: (BuildContext context,
    //         AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    //       if (!snapshot.hasData) return const Text("Loading...");
    //       final allFav = (snapshot.data?.data()?["Users"] as List?) ?? [];
    //       return ListView.separated(
    //           shrinkWrap: true,
    //           scrollDirection: Axis.vertical,
    //           physics: const BouncingScrollPhysics(),
    //           itemBuilder: (context, index) {});
    //     });

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
              title: const Text("Profile"),
              backgroundColor: const Color.fromARGB(255, 170, 37, 0),
              centerTitle: true,
            ),
            body: Builder(builder: (context) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
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
                              child: const Icon(Icons.person,
                                  size: 200.0, color: Colors.black),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            TextField(
                                keyboardType: TextInputType.name,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  name = value;
                                  //Do something with the user input.
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hoverColor:
                                      const Color.fromRGBO(97, 167, 238, 0.684),
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
                                  hintText: 'Name',
                                  alignLabelWithHint: true,
                                  label: const Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 170, 0, 0),
                                  ),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: const Color.fromARGB(
                                  255,
                                  170,
                                  37,
                                  0,
                                ),
                              ),
                              // child: Text(userid),
                            ),
                          ],
                        ))),
              );
            })));
  }
}
