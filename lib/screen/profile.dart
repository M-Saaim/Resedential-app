// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';
import 'package:resedentialapp/screen/homepage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? username;
  late String email;
  String? phone;
  String? house;
  String? address;
  String? userid;

  late Radius topLeft;

  get textStyle => const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  @override
  void initState() {
    final auth = FirebaseAuth.instance;
    dynamic user = auth.currentUser;
    email = user.email;
    userid = user.uid;
    getdata(email);
    print("username${phone}");
    super.initState();
  }

  Future<String?> getdata(
    String email,
  ) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection("Users");
      final name = await users.doc(email).get();
      // print(name['name'].toString())
      final data = name.data() as Map<String, dynamic>;
      username = data['name'].toString();
      phone = data['mobileno'].toString();
      house = data['home'].toString();
      address = data['address'].toString();
      setState(() {});
      // print("username: $username");
    } catch (e) {
      return 'Error fetching uers';
    }
    return username;
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
            backgroundColor: Colors.lightBlue[200],
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    if (email == 'admin@gmail.com') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Adhome()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePAge()));
                    }
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
              title: const Text("Profile"),
              backgroundColor: const Color.fromARGB(255, 170, 37, 0),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
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
                        color: Colors.lightBlue[200],
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: const Color.fromARGB(255, 161, 154, 153),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Name: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      username.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: const Color.fromARGB(255, 161, 154, 153),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Email I'D: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      email,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: const Color.fromARGB(255, 161, 154, 153),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Mobile no: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      phone.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: const Color.fromARGB(255, 161, 154, 153),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'House No: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      house.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: const Color.fromARGB(255, 161, 154, 153),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Address: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      address.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))),
              );
            })));
  }
}
