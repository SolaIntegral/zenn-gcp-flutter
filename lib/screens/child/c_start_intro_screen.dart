import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'c_start_info_screen.dart';  // 追加
import 'package:firebase_auth/firebase_auth.dart';

class CStartIntroScreen extends StatelessWidget {
  const CStartIntroScreen({super.key});

    @override
  State<CStartIntroScreen> createState() => _CStartIntroScreenState();
}

  class _CStartIntroScreenState extends State<CStartIntroScreen> {
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> _markUserAsRegistered() async {
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'isRegistered': true, // 初回登録完了
    });

    // 次の画面へ遷移
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CStartInfoScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 画面サイズを取得
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 上部のテキスト
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1,
              ),
              child: Text(
                'こんにちは',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.06, // 画面幅に応じたフォントサイズ
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                  height: 1.5,
                ),
              ),
            ),

            // キャラクター画像
            Flexible(
              child: Image.asset(
                'lib/assets/chara1.png',
                height: screenHeight * 0.35, // 画面高さの35%で表示
                fit: BoxFit.contain,
              ),
            ),

            // 下部のボタンエリア
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1EC9A8), // 緑の背景色
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.04,
                horizontal: screenWidth * 0.1,
              ),
              child: CustomButton(
                text: 'はじめる',
                onPressed: ()  _markUserAsRegistered,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
