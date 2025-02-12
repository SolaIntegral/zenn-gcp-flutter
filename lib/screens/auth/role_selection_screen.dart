// RoleSelectionScreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/child/c_start_intro_screen.dart';
import 'package:flutter_app1/screens/parent/p_registration_screen1.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '利用者の選択',
          style: const TextStyle(
              color: Color(0xFF684B09), fontWeight: FontWeight.w800),
        ),
        backgroundColor: Color(0xFFF2EEE9),
        leading: null,
      ),
      backgroundColor: Color(0xFFF2EEE9),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenWidth * 0.2),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // 背景を白に設定
                fixedSize: Size(screenWidth * 0.6,
                    screenWidth * 0.44), // 正方形のサイズ（例：100×100）
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // 角を丸く（例：16）
                  side: const BorderSide(
                      width: 4, color: Color(0xFFFEDE6B)), // 茶色のボーダー
                ),
                elevation: 4, // 必要に応じて影の設定（ここでは無くしています）
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.child_care_outlined,
                    color: Colors.brown,
                    size: screenWidth * 0.2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "お子さん",
                    style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.07),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth * 0.08),
            ElevatedButton(
              onPressed: () {
                // 親を選択した場合 → 親用登録画面へ遷移
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PRegisterScreen1(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // 背景を白に設定
                fixedSize: Size(screenWidth * 0.6,
                    screenWidth * 0.44), // 正方形のサイズ（例：100×100）
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // 角を丸く（例：16）
                  side: const BorderSide(
                      width: 4, color: Color(0xFF15BBA1)), // 茶色のボーダー
                ),
                elevation: 4, // 必要に応じて影の設定（ここでは無くしています）
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Colors.brown,
                    size: screenWidth * 0.24,
                  ),
                  Text(
                    "お家の人",
                    style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.07),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
