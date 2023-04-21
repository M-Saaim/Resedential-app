// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resedentialapp/screen/polls.dart';
// import 'package:polls/polls.dart';

class Voting extends StatefulWidget {
  const Voting({Key? key}) : super(key: key);

  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> {
  late String email;
  late String userid;
  String? position;
  late String voter1;
  late String voter2;
  String? tvote1;
  String? tvote2;
  double option1 = 2.0;
  double option2 = 1.0;

  Map usersWhoVoted = {
    'test@gmail.com': 1,
    'deny@gmail.com': 3,
    'kent@gmail.com': 2,
    'xyz@gmail.com': 3
  };
  String creator = "admin@gmail.com";

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
          FirebaseFirestore.instance.collection("Voting");
      final name = await users.doc('admin@gmail.com').get();
      // print(name['name'].toString())
      final data = name.data() as Map<String, dynamic>;
      position = data['Position'].toString();
      voter1 = data['VoterName1'].toString();
      voter2 = data['VoterName2'].toString();
      tvote1 = data['TVotes1'].toString();
      tvote2 = data['TVotes2'].toString();
      print("Position : ${position}");
      setState(() {});
    } catch (e) {
      return 'Error fetching uers';
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Voting Polls',
      home: Polls(),
      debugShowCheckedModeBanner: false,
      //     home: Scaffold(
      //   appBar: AppBar(
      //     leading: IconButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => const HomePAge()));
      //         },
      //         icon: const Icon(Icons.arrow_back_rounded)),
      //     title: const Text("Voting"),
      //     backgroundColor: const Color.fromARGB(255, 170, 37, 0),
      //     centerTitle: true,
      //     shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           bottomRight: Radius.circular(25),
      //           bottomLeft: Radius.circular(25)),
      //     ),
      //   ),
      //   // body: Builder(builder: (context) {
      //   //   return Padding(
      //   //     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      //   //     child: Column(
      //   //       mainAxisAlignment: MainAxisAlignment.center,
      //   //       crossAxisAlignment: CrossAxisAlignment.center,
      //   //       children: [
      //   //         Polls(
      //   //           children: [
      //   //             Polls.options(title: voter1, value: option1),
      //   //             Polls.options(title: voter2, value: option2),
      //   //           ],
      //   //           question: Text(
      //   //             'Voteing for $position',
      //   //             style: const TextStyle(fontSize: 17),
      //   //           ),
      //   //           currentUser: email,
      //   //           creatorID: creator,
      //   //           voteData: usersWhoVoted,
      //   //           userChoice: usersWhoVoted[email],
      //   //           onVoteBackgroundColor: Colors.cyan,
      //   //           leadingBackgroundColor: Colors.cyan,
      //   //           backgroundColor: Colors.white,
      //   //           onVote: (choice) {
      //   //             print(choice);
      //   //             setState(() {
      //   //               usersWhoVoted[email] = choice;
      //   //             });
      //   //             if (choice == 1) {
      //   //               setState(() {
      //   //                 option1 += 1.0;
      //   //               });
      //   //             }
      //   //             if (choice == 2) {
      //   //               setState(() {
      //   //                 option2 += 1.0;
      //   //               });
      //   //             }
      //   //           },
      //   //         ),
      //   //       ],
      //   //     ),
      //   //   );
      //   // }),
      //   body: const Polls(),
      //   debugShowCheckedModeBanner: false,
      // )
    );
  }

  // Widget _buildBody(BuildContext context) {
  //   // return StreamBuilder<QuerySnapshot>(
  //   //   stream: Firestore.instance
  //   //       .collection('candidate')
  //   //       .orderBy('votes', descending: true)
  //   //       .orderBy('name')
  //   //       .snapshots(),
  //   //   builder: (context, snapshot) {
  //   //     if (!snapshot.hasData) return LinearProgressIndicator();
  //   //     return _buildList(context, snapshot.data.documents);
  //   //   },
  //   // );
  //   Polls(
  //     children: [
  //       Polls.options(title: voter1, value: option1),
  //       Polls.options(title: voter2, value: option2),
  //     ],
  //     question: Text(
  //       'Voteing for $position',
  //       style: const TextStyle(fontSize: 17),
  //     ),
  //     currentUser: this.user,
  //     creatorID: this.creator,
  //     voteData: usersWhoVoted,
  //     userChoice: usersWhoVoted[this.user],
  //     onVoteBackgroundColor: Colors.cyan,
  //     leadingBackgroundColor: Colors.cyan,
  //     backgroundColor: Colors.white,
  //     onVote: (choice) {
  //       print(choice);
  //       setState(() {
  //         this.usersWhoVoted[this.user] = choice;
  //       });
  //       if (choice == 1) {
  //         setState(() {
  //           option1 += 1.0;
  //         });
  //       }
  //       if (choice == 2) {
  //         setState(() {
  //           option2 += 1.0;
  //         });
  //       }
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

// class Record {
//   final String name;
//   final int votes;
//   final DocumentReference reference;

//   Record.fromMap(Map<String, dynamic> map, {required this.reference})
//       : assert(map['name'] != null),
//         assert(map['votes'] != null),
//         name = map['name'],
//         votes = map['votes'];

//   Record.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data as Map<String, dynamic>,
//             reference: snapshot.reference);

//   @override
//   String toString() => "Record<$name:$votes>";
// }
