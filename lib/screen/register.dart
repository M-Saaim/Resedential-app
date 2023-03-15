// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
// import 'package:resedentialapp/shared/constants.dart';
// import 'package:resedentialapp/services/auth.dart';
import 'package:resedentialapp/shared/loading.dart';
// import 'package:resedentialapp/shared/snackbarpage.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  late String _email, _password, name, flatno;
  String wing = '';
  bool buttonEnabled = false;
  bool obscureText = true;
  bool loading = false;
  Color visibiltyIconColor = Colors.grey;

  Color get kAmaranth => const Color(0xffE52B50);

  void unHidePassword() {
    setState(() {
      obscureText = !obscureText;
    });
    if (obscureText == true) {
      setState(() {
        visibiltyIconColor = Colors.grey;
      });
    } else {
      setState(() {
        visibiltyIconColor = kAmaranth;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const Loading()
        : Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 300.0,
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Create an account',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            },
                            validator: (val) {
                              return val!.isEmpty
                                  ? 'Name cannot be empty'
                                  : null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Your Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (val) {
                                    wing = val;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Wing',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  onChanged: (val) {
                                    flatno = val;
                                  },
                                  validator: (val) {
                                    return val!.isEmpty
                                        ? 'Enter flat no'
                                        : null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Flat no.',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            onChanged: (val) {
                              setState(() {
                                _email = val;
                              });
                            },
                            validator: (val) {
                              return val!.isEmpty ? 'Enter an email' : null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Email ID',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            obscureText: obscureText,
                            onChanged: (val) {
                              setState(() {
                                _password = val;
                              });
                            },
                            validator: (val) {
                              return val!.length < 4
                                  ? 'Password must be minimum of 4 characters'
                                  : null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.visibility,
                                  color: visibiltyIconColor,
                                ),
                                onPressed: unHidePassword,
                              ),
                              labelText: 'Password',
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       primary: kAmaranth,
                          //     ),
                          //     onPressed: () async {
                          //       if (_formkey.currentState!.validate()) {
                          //         setState(() {
                          //           loading = true;
                          //         });
                          //         dynamic result = await _auth
                          //             .createUserWithEmailAndPassword(_email,
                          //                 _password, name, wing, flatno);
                          //         if (result == null) {
                          //           setState(() {
                          //             loading = false;
                          //           });
                          //         }
                          //       }
                          //     },
                          //     child: const Text('Continue'),
                          //   ),
                          // ),
                          TextButton(
                            onPressed: () {
                              widget.toggle();
                            },
                            child: Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: kAmaranth,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
