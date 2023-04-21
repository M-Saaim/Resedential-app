import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:resedentialapp/screen/homepage.dart';
import 'package:resedentialapp/screen/voting.dart';

late String email;
late String userid;
String? position;
late String voter1;
late String voter2;
String? tvote1;
String? tvote2;

class Polls extends StatefulWidget {
  const Polls({Key? key}) : super(key: key);

  @override
  State<Polls> createState() => _PollsState();
}

class _PollsState extends State<Polls> {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePAge()));
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text('Voting Polls 🗳'),
        backgroundColor: const Color.fromARGB(255, 170, 37, 0),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: polls().length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> poll = polls()[index];

            final int days = DateTime(
              poll['end_date'].year,
              poll['end_date'].month,
              poll['end_date'].day,
            )
                .difference(DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ))
                .inDays;

            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: FlutterPolls(
                pollId: poll['id'].toString(),
                // hasVoted: hasVoted.value,
                // userVotedOptionId: userVotedOptionId.value,
                onVoted: (PollOption pollOption, int newTotalVotes) async {
                  await Future.delayed(const Duration(seconds: 1));

                  /// If HTTP status is success, return true else false
                  return true;
                },
                pollEnded: days < 0,
                pollTitle: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    poll['question'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                pollOptions: List<PollOption>.from(
                  poll['options'].map(
                    (option) {
                      var a = PollOption(
                        id: option['id'],
                        title: Text(
                          option['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        votes: option['votes'],
                      );
                      return a;
                    },
                  ),
                ),
                votedPercentageTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                metaWidget: Row(
                  children: [
                    const SizedBox(width: 6),
                    const Text(
                      '•',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      days < 0 ? "ended" : "ends $days days",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List polls() => [
      {
        'id': 1,
        'question': 'Voteing for $position',
        'end_date': DateTime(2023, 4, 28),
        'options': [
          {
            'id': 1,
            'title': voter1,
            'votes': 40,
          },
          {
            'id': 2,
            'title': voter2,
            'votes': 20,
          },
        ],
      },
    ];
