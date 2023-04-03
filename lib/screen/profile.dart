// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
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

  late String users;

  // Profile(this.name);

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
              title: const Text("Profile"),
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

                          //  CollectionReference users = FirebaseFirestore.instance.collection('Users');

                          //  return FutureBuilder<DocumentSnapshot>(

                          //   future: students.doc(documentId).get(),
                          //   (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                          //     //Error Handling conditions
                          //     if (snapshot.hasError) {
                          //       return Text("Something went wrong");
                          //       }
                          //     if (snapshot.hasData && !snapshot.data!.exists) {
                          //       return Text("Document does not exist");
                          //       }
                          //       //Data is output to the user
                          //       if (snapshot.connectionState == ConnectionState.done) {
                          //         Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                          //         return Text("Full Name: ${data['full_name']} ${data['last_name']}");
                          //         }

                          //         return Text("loading");
                          //         },
                          //       );
                        ],
                      )));
            })));
  }
}
