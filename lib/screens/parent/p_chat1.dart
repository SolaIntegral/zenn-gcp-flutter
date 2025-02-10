import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/parent/p_registration_screen_2.dart';
import 'package:flutter_app1/widgets/custom_base.dart';

class PChat1Screen extends StatelessWidget {
  const PChat1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBase(
      title: 'チャット履歴',
      body: Center(
        child: Column(
          children: [
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
      currentIndex: 2,
    );
  }
}
