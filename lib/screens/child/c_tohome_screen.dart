import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'home_screen.dart'; // 次の遷移先

class CToHomeScreen extends StatelessWidget {
  const CToHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown, size: screenWidth * 0.08),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // コンテンツ部分
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.15),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // キャラクター画像
                    Image.asset(
                      'lib/assets/chara1.png',
                      height: screenHeight * 0.3,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // 「おかえり！」テキスト
                    const Text(
                      'おかえり！',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // 日数表示
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02, horizontal: screenWidth * 0.1),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1EC9A8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '10 日目',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 固定の「つぎへ」ボタン
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1EC9A8),
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
                text: 'つぎへ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
