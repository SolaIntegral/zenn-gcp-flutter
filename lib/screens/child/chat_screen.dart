import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 上部の背景
          Container(
            width: double.infinity,
            height: screenHeight * 0.1,
            color: const Color(0xFF1EC9A8),
          ),

          // チャットバブル
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Text(
                  '今日はどんなことをした？',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
            ),
          ),

          // キャラクター画像
          Image.asset(
            'lib/assets/chara1.png',
            height: screenHeight * 0.2,
          ),

          const Spacer(),

          // チャット入力エリア
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: const Color(0xFF1EC9A8),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                // 入力エリア
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'なまえに何か話しかけてみよう',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(Icons.arrow_forward, color: Colors.teal),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                
                // 選択ボタン
                Wrap(
                  spacing: screenWidth * 0.05,
                  runSpacing: screenHeight * 0.01,
                  children: [
                    _buildChatButton('がんばった！'),
                    _buildChatButton('たいへんだった'),
                    _buildChatButton('ほめて'),
                    _buildChatButton('なにか話して'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
