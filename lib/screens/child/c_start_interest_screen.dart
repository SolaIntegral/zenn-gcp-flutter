import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class CStartInterestScreen extends StatelessWidget {
  const CStartInterestScreen({super.key});

  final List<Map<String, dynamic>> interests = const [
    {'icon': Icons.brush, 'label': 'お絵描きをすること'},
    {'icon': Icons.sports_basketball, 'label': '運動すること'},
    {'icon': Icons.book, 'label': '勉強すること'},
    {'icon': Icons.bed, 'label': 'たくさん寝ること'},
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '好きなことを教えてね',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 20),
            ...interests.map((interest) => Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(interest['icon'], color: Colors.brown),
                    title: Text(interest['label']),
                    onTap: () {},
                  ),
                )),
            const Spacer(),
            CustomButton(
              text: 'つぎへ',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
