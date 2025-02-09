import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/child/c_start_intro_screen.dart';
import 'package:flutter_app1/screens/parent/p_day1_screen.dart';

class CPselectScreen extends StatelessWidget {
  const CPselectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('利用者の選択'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CStartIntroScreen()),
                );
              },
              child: const Text("お子さん"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PDay1Screen()),
                );
              },
              child: const Text("おうちの人"),
            ),
          ],
        ),
      ),
    );
  }
}
