// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Voting extends StatefulWidget {
  const Voting({Key? key}) : super(key: key);

  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> {
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePAge()));
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text("Voting"),
        backgroundColor: const Color.fromARGB(255, 170, 37, 0),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      // body: Builder(builder: (context) {
      //   return Padding(
      //       padding:
      //           const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      //       child: Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         color: Colors.white,
      //       ));
      // })
      // body: _buildBody(context),
    ));
  }

  // Widget _buildBody(BuildContext context) {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: Firestore.instance
  //         .collection('candidate')
  //         .orderBy('votes', descending: true)
  //         .orderBy('name')
  //         .snapshots(),
  //     builder: (context, snapshot) {
  //       if (!snapshot.hasData) return LinearProgressIndicator();

  //       return _buildList(context, snapshot.data.documents);
  //     },
  //   );
  // }

  // Widget _buildList(
  //   BuildContext context, DocumentSnapshot data, String topElement) {
  // final record = Record.fromSnapshot(data);

  // return Padding(
  //   key: ValueKey(record.name),
  //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //   child: Container(
  //     decoration: BoxDecoration(
  //       border: record.name == topElement
  //           ? Border.all(color: Colors.black)
  //           : Border.all(color: Colors.grey),
  //       color: record.name == topElement ? Colors.lightGreen : Colors.white,
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     child: ListTile(
  //       title: Text(
  //         record.name,
  //         style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
  //       ),
  //       trailing: Text(
  //         record.votes.toString(),
  //         style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
  //       ),
  //       onTap: () => record.reference.updateData({'votes': record.votes + 1}),
  //     ),
  //   ),
//   );
// }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
