import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'c_start_interest_screen.dart';

class CStartGradeScreen extends StatelessWidget {
  const CStartGradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final List<String> grades = ['小学2年生', '小学3年生', '小学4年生'];

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'きみの名前とがくねんを教えてね',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '名前',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ...grades.map((grade) => ListTile(
                  title: Text(grade),
                  leading: const Icon(Icons.school, color: Colors.brown),
                  onTap: () {},
                )),
            const Spacer(),
            CustomButton(
              text: 'つぎへ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CStartInterestScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
