import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/parent/p_home_screen.dart';

class PWelcomebackScreen extends StatelessWidget {
  const PWelcomebackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xFF15BBA1),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "おかえりなさい！",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: screenWidth * 0.09),
                ),
                const SizedBox(height: 10), // テキストの間隔を追加

                const SizedBox(height: 20), // 画像との間隔を調整
                Image.asset("assets/chara3.png", fit: BoxFit.contain),
                const SizedBox(height: 20), // ボタンとの間隔を調整
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PHomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEDE6B), // 修正: 正しい背景色の指定方法
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15), // ボタンのサイズ調整
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 角丸
                    ),
                  ),
                  child: Text(
                    "Welcome back!→",
                    style: TextStyle(
                        color: Color(0xFF684B09),
                        fontWeight: FontWeight.w900,
                        fontSize: screenWidth * 0.05), // 40 → 30 にしてバランス調整
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
