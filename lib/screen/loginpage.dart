import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';
import 'package:resedentialapp/screen/homepage.dart';
import 'package:resedentialapp/screen/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                //   child: SizedBox(
                //     height: 150,
                //     width: MediaQuery.of(context).size.width,
                //     // color: Colors.red[50],
                //     child: const CustomPaint(
                //         //painter: CurvedPainter(),
                //         ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextLiquidFill(
                        text: 'Residential Mgmt.',
                        waveColor: Colors.black,
                        boxBackgroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold),
                        boxHeight: 200.0,
                      ),
                      // AnimatedTextKit(
                      //   animatedTexts: [
                      //     for (final txt in _kTexts)
                      //       TypewriterAnimatedText(
                      //         txt,
                      //         textStyle: _kTextStyle,
                      //         textAlign: TextAlign.start,
                      //       )
                      //   ],
                      // ),
                      Text("Welcome,",
                          style: GoogleFonts.nunitoSans(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            letterSpacing: 1.9,
                          ))),
                      Text("Login Now",
                          style: GoogleFonts.nunitoSans(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            letterSpacing: 1.9,
                          ))),
                      const SizedBox(
                        height: 0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            "If you're new /",
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
                                        builder: (context) => const SignIn()));
                              },
                              child: Text(
                                "Create Account",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.deepPurple.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800)),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
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
                              Icons.mail_lock,
                              color: Color.fromARGB(255, 170, 0, 0),
                            ),
                            // labelText: "Email"
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
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
                            fillColor: Colors.black12,
                            filled: true,
                            hoverColor:
                                const Color.fromRGBO(97, 167, 238, 0.684),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple.shade400,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(9)),
                            label: const Icon(
                              Icons.private_connectivity_rounded,
                              color: Color.fromARGB(255, 170, 0, 0),
                            ),
                            hintText: 'Password',
                          )),
                      const SizedBox(
                        height: 24.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (email == 'admin@gmail.com') {
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Adhome()));
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
                          } else {
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              // ignore: use_build_context_synchronously
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
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            backgroundColor:
                                const Color.fromARGB(255, 170, 0, 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        child: Text(
                          "Login",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var center = size / 2;
    // var paint = Paint()
    //   ..color = Colors.red
    //   ..strokeWidth = 10.0;

    // canvas.drawLine(
    //     Offset(0, center.height), Offset(size.width, center.height), paint);
    var paint = Paint()
      ..color = Colors.deepPurple[400]!
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    // path.lineTo(0, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, size.height / 1.8);
    path.lineTo(0, size.height / 1.8);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 1.8);
    path.lineTo(0, size.height / 1.1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
