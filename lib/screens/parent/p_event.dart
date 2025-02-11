import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/parent/p_registration_screen_2.dart';
import 'package:flutter_app1/widgets/custom_base.dart';

class PEventScreen extends StatelessWidget {
  const PEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBase(
      title: 'イベント情報',
      body: Center(
          child: Text(
        "Coming soon...!",
        style: TextStyle(
            color: Color(0xFF684B09),
            fontSize: 20,
            fontWeight: FontWeight.w600),
      )),
      currentIndex: 2,
    );
  }
}
