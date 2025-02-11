import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class CPlanScreen extends StatefulWidget {
  const CPlanScreen({super.key});

  @override
  State<CPlanScreen> createState() => _CPlanScreenState();
}

class _CPlanScreenState extends State<CPlanScreen> {
  int? selectedPlan; // 選択された予定を保持

  final List<String> plans = [
    '家にいる',
    '塾に行く',
    '友達と遊びに行く',
    'よくなかった',
  ];

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
                      value: 1.0,
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
                              'このあとの予定は？',
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
                    ...List.generate(plans.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPlan = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02, horizontal: screenWidth * 0.04),
                          decoration: BoxDecoration(
                            color: selectedPlan == index
                                ? const Color(0xFF1EC9A8).withOpacity(0.2)
                                : Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selectedPlan == index
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: selectedPlan == index
                                    ? const Color(0xFF1EC9A8)
                                    : Colors.grey,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                plans[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                  fontSize: 18,
                                ),
                              ),
                            ],
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
                onPressed: () {
                  if (selectedPlan != null) {
                    // 次の画面へ遷移（必要なら追加）
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('このあとの予定を選択してください')),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
