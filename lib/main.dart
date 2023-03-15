// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resedentialapp/screen/homepage.dart';
import 'package:resedentialapp/screen/signin.dart';

void main() async {
// WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "sign_in_screen",
      onGenerateRoute: (settings) {
        late Widget currentScreen;
        switch (settings.name) {
          case 'registration_screen':
            currentScreen = const SignIn();
            break;
          // case 'login_screen':
          //   currentScreen = LoginPage();
          //   break;
          case 'home_screen':
            currentScreen = const HomePAge();
            break;
          case 'sign_in_screen':
            currentScreen = const SignIn();
            break;
          default:
            currentScreen = const SignIn();
            break;
        }
        return MaterialPageRoute(builder: (context) => currentScreen);
      },
    );
  }
}
