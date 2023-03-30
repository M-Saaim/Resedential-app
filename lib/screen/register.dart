import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/homepage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String name;
  late String email;
  late String phone;
  late String house;
  late String address;
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
              title: const Text("Register"),
              backgroundColor: const Color.fromARGB(255, 170, 37, 0),
              centerTitle: true,
            ),
            body: Builder(builder: (context) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              name = value;
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
                              hintText: 'Name',
                              alignLabelWithHint: true,
                              label: const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 170, 0, 0),
                              ),
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              email = value;
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
                              hintText: 'Email',
                              alignLabelWithHint: true,
                              label: const Icon(
                                Icons.mail,
                                color: Color.fromARGB(255, 170, 0, 0),
                              ),
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              phone = value;
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
                              hintText: 'Mobile No.',
                              alignLabelWithHint: true,
                              label: const Icon(
                                Icons.phone,
                                color: Color.fromARGB(255, 170, 0, 0),
                              ),
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              house = value;
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
                              hintText: 'Room no/Wing',
                              alignLabelWithHint: true,
                              label: const Icon(
                                Icons.house_rounded,
                                color: Color.fromARGB(255, 170, 0, 0),
                              ),
                              // labelText: "Email"
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              email = value;
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
                              hintText: 'Email',
                              alignLabelWithHint: true,
                              label: const Icon(
                                Icons.mail,
                                color: Color.fromARGB(255, 170, 0, 0),
                              ),
                              // labelText: "Email"
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        ElevatedButton(
                          onPressed: () async {
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
                          child: Text(
                            "Register",
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 1.3,
                                    fontWeight: FontWeight.w800)),
                          ),
                        ),
                      ],
                    ),
                  ));
            })));
  }
}
