import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  late String complt;
  late String userid;

  @override
  void initState() {
    final auth = FirebaseAuth.instance;
    dynamic user = auth.currentUser;

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
              title: const Text("Complaints"),
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
                      child: Column(children: [
                        TextField(
                          keyboardType: TextInputType.multiline,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            complt = value;
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
                            hintText: 'Complaint',
                            alignLabelWithHint: true,
                            label: const Icon(
                              Icons.comment_outlined,
                              color: Color.fromARGB(255, 170, 0, 0),
                            ),
                          ),
                          maxLines: 5,
                          minLines: 1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            Map<String, String> datatoSave = {
                              'complaint': complt,
                              'user uid': userid,
                            };

                            FirebaseFirestore.instance
                                .collection('Complaints')
                                .add(datatoSave);
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
                                  borderRadius: BorderRadius.circular(10.0))),
                          child: Column(
                            children: [
                              Text(
                                "Submit",
                                style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: 1.3,
                                        fontWeight: FontWeight.w800)),
                              ),
                              Text(
                                "Complaints",
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
                      ])),
                ),
              );
            })));
  }
}
