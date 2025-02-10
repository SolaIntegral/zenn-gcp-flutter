import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/custom_base.dart';

class PHomeScreen extends StatelessWidget {
  const PHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBase(
      title: 'Home',
      body: Center(
        child: Text("ここがおうちの人のホームページです"),
      ),
    );
  }
}
