import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/homepage.dart';

class Visitors extends StatefulWidget {
  const Visitors({Key? key}) : super(key: key);

  @override
  State<Visitors> createState() => _VisitorsState();
}

class _VisitorsState extends State<Visitors> {
  late String visitorname;
  late String visitorsphone;
  late String visitinghouse;
  late String visitingdate;
  late String email;
  late String userid;

  @override
  void initState() {
    final auth = FirebaseAuth.instance;
    dynamic user = auth.currentUser;
    email = user.email;

    userid = user.uid;

    super.initState();
  }

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
              title: const Text("Visitors"),
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
                          TextField(
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                visitorname = value;
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
                                hintText: "Visitor's Name",
                                alignLabelWithHint: true,
                                label: const Icon(
                                  Icons.person_4_outlined,
                                  color: Color.fromARGB(255, 170, 0, 0),
                                ),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          TextField(
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                visitorsphone = value;
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
                                hintText: 'Visitors Mobile No.',
                                alignLabelWithHint: true,
                                label: const Icon(
                                  Icons.phone_enabled_outlined,
                                  color: Color.fromARGB(255, 170, 0, 0),
                                ),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          TextField(
                              keyboardType: TextInputType.streetAddress,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                visitinghouse = value;
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
                                hintText: 'Visiting Room no/Wing',
                                alignLabelWithHint: true,
                                label: const Icon(
                                  Icons.other_houses,
                                  color: Color.fromARGB(255, 170, 0, 0),
                                ),
                                // labelText: "Email"
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          TextField(
                              keyboardType: TextInputType.datetime,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                visitingdate = value;
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
                                hintText: 'Visiting Date',
                                alignLabelWithHint: true,
                                label: const Icon(
                                  Icons.date_range_outlined,
                                  color: Color.fromARGB(255, 170, 0, 0),
                                ),
                                // labelText: "Email"
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              Map<String, String> datatoSave = {
                                'Visitors name': visitorname,
                                'Visitors mobile no': visitorsphone,
                                'Visiting home': visitinghouse,
                                'Visiting Date': visitingdate,
                                'User uid': userid
                              };

                              FirebaseFirestore.instance
                                  .collection('Visitors')
                                  .doc(email)
                                  .set(datatoSave);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePAge()));
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15.0),
                                backgroundColor:
                                    const Color.fromARGB(255, 170, 0, 0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            child: Column(
                              children: [
                                Text(
                                  "Enter",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          letterSpacing: 1.3,
                                          fontWeight: FontWeight.w800)),
                                ),
                                Text(
                                  "Visitors",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          letterSpacing: 1.3,
                                          fontWeight: FontWeight.w800)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            })));
  }
}
