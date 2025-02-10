import 'package:flutter/material.dart';

class PHomeScreen extends StatelessWidget {
  const PHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("おうちの人のホームページ")),
      body: const Center(
        child: Text("ここがおうちの人のホームページです"),
      ),
    );
  }
}
