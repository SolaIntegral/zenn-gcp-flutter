import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? "user";
  final String aiId = "ai_bot"; // AIメッセージ用の固定ID

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _firestore.collection('chat').add({
        'senderId': userId,
        'message': _controller.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _controller.clear();
    }
  }

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

          // チャット履歴表示
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chat')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                var messages = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var chatData = messages[index].data() as Map<String, dynamic>? ?? {};
                    bool isUserMessage = chatData['senderId'] == userId;
                    bool isAiMessage = chatData['senderId'] == aiId;

                    return Align(
                      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isUserMessage
                              ? Colors.lightBlueAccent
                              : isAiMessage
                                  ? Colors.grey[300]
                                  : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: isUserMessage
                                ? const Radius.circular(20)
                                : const Radius.circular(0),
                            topRight: isUserMessage
                                ? const Radius.circular(0)
                                : const Radius.circular(20),
                            bottomLeft: const Radius.circular(20),
                            bottomRight: const Radius.circular(20),
                          ),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          chatData['message'] ?? '',
                          style: const TextStyle(fontSize: 16, color: Colors.brown),
                        ),
                      ),
                    );
                  },
                );
              },
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
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'なまえに何か話しかけてみよう',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.teal),
                        onPressed: _sendMessage,
                      ),
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
      onPressed: () {
        setState(() {
          _controller.text = text;
        });
        _sendMessage();
      },
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
