import 'package:flutter/material.dart';

class PDay1Screen extends StatelessWidget {
  const PDay1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("お家の人の画面"),
      ),
      body: const Center(
        child: Text("ここはお家の人の画面です"),
      ),
    );
  }
}
