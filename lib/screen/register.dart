import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Register"),
              backgroundColor: Color.fromARGB(255, 170, 37, 0),
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
                            ))
                      ],
                    ),
                  ));
            })));
  }
}
