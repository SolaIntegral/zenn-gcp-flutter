import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/auth/role_selection_screen.dart';
import 'package:flutter_app1/screens/parent/p_registration_screen_2.dart';

class PRegisterScreen1 extends StatelessWidget {
  const PRegisterScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: null,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.brown, size: 30),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
        //     );
        //   },
        // ),
      ),
      backgroundColor: const Color(0xFF15BBA1),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenHeight * 0.06, vertical: screenHeight * 0.02),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "こんにちは！",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40),
              ),
              const SizedBox(height: 10), // テキストの間隔を追加
              const Text(
                "最初にいくつかあなたのことを教えてください！",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              // const SizedBox(height: 20), // 画像との間隔を調整
              Image.asset("assets/chara2.png", fit: BoxFit.contain),
              // const SizedBox(height: 20), // ボタンとの間隔を調整
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PRegisterScreen2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEDE6B), // 修正: 正しい背景色の指定方法
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15), // ボタンのサイズ調整
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 角丸
                    ),
                    elevation: 5),
                child: const Text(
                  "NEXT→",
                  style: TextStyle(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w900,
                      fontSize: 30), // 40 → 30 にしてバランス調整
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
