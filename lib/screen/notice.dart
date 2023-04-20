// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/homepage.dart';

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  late String email;
  late String userid;
  String? notice;

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
    // print("Notice :${notice}");
    super.initState();
  }

  Future<String?> getdata(
    String email,
  ) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection("Notice");
      final name = await users.doc('admin@gmail.com').get();
      // print(name['name'].toString())
      final data = name.data() as Map<String, dynamic>;
      notice = data['Notice'].toString();
      print("Notice : ${notice}");
      setState(() {});
    } catch (e) {
      return 'Error fetching uers';
    }
    return notice;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.lightBlue[200],
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePAge()));
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
              title: const Text("Notice"),
              backgroundColor: const Color.fromARGB(255, 170, 37, 0),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
            ),
            body: Builder(builder: (context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Notice: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          notice.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
