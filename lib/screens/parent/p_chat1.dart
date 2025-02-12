import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/parent/p_registration_screen_2.dart';
import 'package:flutter_app1/widgets/custom_base.dart';

class PChat1Screen extends StatelessWidget {
  const PChat1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBase(
      title: 'チャット履歴',
      body: Center(
          child: Text(
        "Coming soon...!",
        style: TextStyle(
            color: Color(0xFF684B09),
            fontSize: 20,
            fontWeight: FontWeight.w600),
      )),
      currentIndex: 0,
    );
  }
}
