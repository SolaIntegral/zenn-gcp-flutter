import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'chat_screen.dart'; // 次の遷移先

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 上部の背景部分
          Container(
            width: double.infinity,
            height: screenHeight * 0.25,
            color: const Color(0xFF1EC9A8),
          ),

          // キャラクター画像
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.1),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: screenWidth * 0.2,
              child: Image.asset(
                'assets/chara1.png',
                height: screenHeight * 0.2,
              ),
            ),
          ),

          // 名前の表示
          const Text(
            'なまえ',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
          ),

          SizedBox(height: screenHeight * 0.02),

          // 育成日数表示
          Container(
            width: screenWidth * 0.8,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Column(
              children: [
                _buildTextRow('育て始めてから', '10日'),
                _buildTextRow('大きくなるまであと', '4日'),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          // 「おはなししにいく」ボタン
          CustomButton(
            text: 'おはなししにいく',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              );
            },
          ),

          const Spacer(),

          // 「育てたことのあるキャラクター」テキスト
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: const Text(
              '育てたことのあるキャラクター',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextRow(String leftText, String rightText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: const TextStyle(
                fontSize: 16, color: Colors.brown, fontWeight: FontWeight.w500),
          ),
          Text(
            rightText,
            style: const TextStyle(
                fontSize: 18, color: Colors.brown, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
