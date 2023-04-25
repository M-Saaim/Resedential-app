// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';

List<String> acc = [
  'sam@gmail.com',
  'ns@gmail.com',
  'gupta@gmail.com',
  'jebastin@gmail.com',
  'joefrance@gmail.com'
];

class Advisitors extends StatefulWidget {
  const Advisitors({Key? key}) : super(key: key);

  @override
  State<Advisitors> createState() => _AdvisitorsState();
}

class _AdvisitorsState extends State<Advisitors> {
  late String email;
  late String userid;
  String? visitorname;
  String? visitorsphone;
  String? visitinghouse;
  String? visitingdate;

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

  Future<Object?> getdata(
    String email,
  ) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection("Visitors");
      var ac;
      var i;
      for (i = 0; i + 1;) {
        for (ac in acc) {
          final name = await users.doc(ac).get();
          final data = name.data() as Map<String, dynamic>;
          visitorname = data['Visitors name'];
          visitorsphone = data['Visitors mobile no'];
          visitinghouse = data['Visiting home'];
          visitingdate = data['Visiting Date'];
          print("VisitorName : $visitorname");
          setState(() {});
        }
      }
      // print(name['name'].toString())
    } catch (e) {
      return 'Error fetching uers';
    }
    return visitorname;
  }

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
              title: const Text("Admin-Visitors"),
              backgroundColor: const Color.fromARGB(255, 170, 37, 0),
              centerTitle: true,
            ),
            body: Builder(builder: (context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.09,
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
                              'Visitors Name: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              visitorname.toString(),
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
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.09,
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
                              'Visitors Phone No: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              visitorsphone.toString(),
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
                ),
              );
            })));
  }
}
