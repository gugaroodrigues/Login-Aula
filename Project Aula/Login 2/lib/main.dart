import 'package:flutter/material.dart';
import 'package:login_2/screens/details_screen.dart';
import 'package:login_2/screens/home_login.dart';
import 'package:login_2/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home_login',
      routes: {
        '/': (context) => LoginPage(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}

