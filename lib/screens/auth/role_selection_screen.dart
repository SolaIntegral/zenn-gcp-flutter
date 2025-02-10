// RoleSelectionScreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/child/c_start_intro_screen.dart';
import 'package:flutter_app1/screens/parent/p_registration_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

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
                // こどもを選択した場合 → こども用登録画面へ遷移
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CStartIntroScreen(),
                  ),
                );
              },
              child: const Text("こども"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 親を選択した場合 → 親用登録画面へ遷移
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PRegisterScreen(),
                  ),
                );
              },
              child: const Text("親"),
            ),
          ],
        ),
      ),
    );
  }
}
