import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/auth/Child_Parent_select_screen.dart';
// import 'screens/child/c_start_intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Child App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const CPselectScreen(),
    );
  }
}
