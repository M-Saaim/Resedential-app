// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> acc = [
  'sam@gmail.com',
  'ns@gmail.com',
  'gupta@gmail.com',
  'jebastin@gmail.com',
  'joefrance@gmail.com'
];

class Adcomplaints extends StatefulWidget {
  const Adcomplaints({Key? key}) : super(key: key);

  @override
  State<Adcomplaints> createState() => _AdcomplaintsState();
}

class _AdcomplaintsState extends State<Adcomplaints> {
  late String email;
  late String userid;
  String? complaints;

  String? mail;

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
          FirebaseFirestore.instance.collection("Complaints");
      var ac;
      for (ac in acc) {
        final name = await users.doc(ac).get();
        final data = name.data() as Map<String, dynamic>;
        mail = ac;
        complaints = data['complaint'];
        print("Notice : ${complaints}");
        setState(() {});
      }
      // print(name['name'].toString())
    } catch (e) {
      return 'Error fetching uers';
    }
    return complaints;
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
              title: const Text("Admin-Complaints"),
              backgroundColor: const Color.fromARGB(255, 170, 37, 0),
              centerTitle: true,
            ),
            body: Builder(builder: (context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Container(
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
                          'Complaint: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          complaints.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })

            // body: ListView(
            //   children: <Widget>[

            //     ListTile(
            //       title: Text(complaints!),
            //     ),
            //     ListTile(
            //       title: Text(acc as String),
            //     ),
            //   ],
            // ),
            ));
  }
}
