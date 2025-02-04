import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'c_start_grade_screen.dart';

class CStartInfoScreen extends StatelessWidget {
  const CStartInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'まずはさいしょに\n君のことを教えてね！',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/character.png', height: 150),
            const SizedBox(height: 30),
            CustomButton(
              text: 'つぎへ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CStartGradeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
