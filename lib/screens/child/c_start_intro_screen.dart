import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'c_start_info_screen.dart';

class CStartIntroScreen extends StatelessWidget {
  const CStartIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'こんにちは！',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/character.png', height: 150),
            const SizedBox(height: 30),
            CustomButton(
              text: 'つぎへ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CStartInfoScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
