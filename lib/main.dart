import 'package:firebase_core/firebase_core.dart';
import 'package:weatherapp/templates/Congcu/main_page.dart';
import 'package:weatherapp/templates/Congcu/my_page.dart';
import 'package:weatherapp/templates/HomePage.dart';
import 'package:weatherapp/templates/Test.dart';
import 'package:weatherapp/templates/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/templates/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/home': (context) => HomePage(),
        '/signup': (context) => SignUpScreen(),
        '/test': (context) => Test(),
        '/mainpage': (context) => MainPage(),
        '/mypage' : (context) => MyPage(),
      },
    );
  }
}