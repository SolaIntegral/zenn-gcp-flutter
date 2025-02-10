import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/parent/p_home_screen.dart';

class PWelcomebackScreen extends StatelessWidget {
  const PWelcomebackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("親のおかえり画面"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PHomeScreen()),
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
          child: const Text(
            "おかえり〜〜",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30), // 40 → 30 にしてバランス調整
          ),
        ),
      ),
    );
  }
}
