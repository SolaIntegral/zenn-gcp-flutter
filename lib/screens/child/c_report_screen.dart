import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'c_homework_screen.dart';  // 次の画面へ遷移

class CReportScreen extends StatefulWidget {
  final String selectedMood; // 受け取る気分

  const CReportScreen({super.key, required this.selectedMood});

  @override
  State<CReportScreen> createState() => _CReportScreenState();
}

class _CReportScreenState extends State<CReportScreen> {
  final TextEditingController _controller = TextEditingController();
  final String userId = "user123"; // TODO: Firebase Authentication から取得する


  // Firestore に日報を保存する関数
  Future<void> _saveReport({required bool isSkipped}) async {
    await FirebaseFirestore.instance.collection('reports').add({
      'userId': userId,
      'date': FieldValue.serverTimestamp(),
      'mood': widget.selectedMood, // 前の画面で選択された気分
      'report': isSkipped ? '' : _controller.text, // スキップ時は空のまま保存
    });

    // 次の画面へ遷移
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CHomeworkScreen()),
    );
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 進捗バー
                    LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation(Color(0xFF1EC9A8)),
                      minHeight: screenHeight * 0.015,
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // 質問とキャラクター
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              '今日あったことを\nひとこと残しておこう',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Image.asset(
                          'lib/assets/chara1.png',
                          height: screenHeight * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // 入力フィールド
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _controller,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ひとことを入力する\n例: ○○が楽しかった、○○がたいへんだった',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // スキップボタン
                    GestureDetector(
                      onTap: () => _saveReport(isSkipped: true),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '今日はスキップする',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(Icons.arrow_forward, color: Colors.brown),
                            ],
                          ),
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
                onPressed: () => _saveReport(isSkipped: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
