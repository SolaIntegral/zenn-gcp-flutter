import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'c_report_screen.dart';  // 次の画面へ遷移
import 'package:cloud_firestore/cloud_firestore.dart';

class CDay1Screen extends StatefulWidget {
  const CDay1Screen({super.key});

  @override
  State<CDay1Screen> createState() => _CDay1ScreenState();
}

class _CDay1ScreenState extends State<CDay1Screen> {
  int? selectedMood; // 選択された気分を保持

  final List<String> moods = [
    'たのしかった！',
    'ふつう',
    'あんまり',
    'よくなかった',
  ];

   final String userId = "user123"; // TODO: Firebase Authentication から取得する

Future<void> _saveMood() async {
  if (selectedMood == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('今日の気分を選択してください')),
    );
    return;
  }

  await FirebaseFirestore.instance.collection('reports').add({
    'userId': userId,
    'date': FieldValue.serverTimestamp(),
    'mood': moods[selectedMood!],
  });

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => CReportScreen(selectedMood: moods[selectedMood!])),
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
                      value: 0.25,
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
                              '今日はどんな一日だった？',
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

                    // 選択肢ボタン
                    ...List.generate(moods.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMood = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02, horizontal: screenWidth * 0.04),
                          decoration: BoxDecoration(
                            color: selectedMood == index
                                ? const Color(0xFF1EC9A8).withOpacity(0.2)
                                : Colors.white,
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
                          child: Center(
                            child: Text(
                              moods[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
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
                onPressed: _saveMood,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
