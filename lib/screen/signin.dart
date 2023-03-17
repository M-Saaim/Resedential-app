import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/homepage.dart';
import 'package:resedentialapp/screen/loginpage.dart';
// import 'package:resedentialapp/screen/homepage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Hi,",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: 1.9,
                ))),
            Text("Sign Up",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: 1.9,
                ))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Row(
              children: [
                Text(
                  "Already have an account /",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 0, 20, 201),
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
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
                  hoverColor: const Color.fromRGBO(97, 167, 238, 0.684),
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
              height: MediaQuery.of(context).size.height * 0.019,
            ),
            TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hoverColor: const Color.fromRGBO(97, 167, 238, 0.684),
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
                  hintText: 'Password',
                  alignLabelWithHint: true,
                  // labelText: "Password",
                  // labelStyle: TextStyle(
                  //   color: Colors.deepPurple.shade400,
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 20,
                  //   letterSpacing: 1.9,
                  // )
                  label: const Icon(
                    Icons.password,
                    color: Color.fromARGB(255, 170, 0, 0),
                  ),
                  // labelText: "Email"
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            ElevatedButton(
              onPressed: () async {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const LoginPage()));

                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePAge()));
                } catch (e) {
                  var error = e.toString().split(']');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Text(e.toString()),
                      ),
                    ),
                  );
                  print(e);
                }
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  backgroundColor: const Color.fromARGB(255, 170, 0, 0),
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
      ),
    );
  }
}
