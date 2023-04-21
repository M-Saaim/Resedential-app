// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resedentialapp/screen/admin/addvoter.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Advoting extends StatefulWidget {
  const Advoting({Key? key}) : super(key: key);

  @override
  State<Advoting> createState() => _AdvotingState();
}

class _AdvotingState extends State<Advoting> {
  String? voter1;
  String? voter2;
  String? position;
  late String email;
  late String userid;
  String? tvote1;
  String? tvote2;

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
          FirebaseFirestore.instance.collection("Voting");
      final name = await users.doc('admin@gmail.com').get();
      // print(name['name'].toString())
      final data = name.data() as Map<String, dynamic>;
      position = data['Position'].toString();
      voter1 = data['VoterName1'].toString();
      voter2 = data['VoterName2'].toString();
      tvote1 = data['TVotes1'].toString();
      tvote2 = data['TVotes2'].toString();
      print("Notice : ${position}");
      setState(() {});
    } catch (e) {
      return 'Error fetching uers';
    }
    return position;
  }

  get textStyle => const TextStyle(
        // color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.lightBlue[200],
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
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    // color: Colors.black,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          position.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const Text(
                          ' : ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    // color: Colors.black,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          voter1.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    // color: Colors.black,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          voter2.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                Container(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Addvoter()));
                        }),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ));
  }
}
