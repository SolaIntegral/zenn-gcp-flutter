import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class CStartInterestScreen extends StatefulWidget {
  const CStartInterestScreen({super.key});

  @override
  State<CStartInterestScreen> createState() => _CStartInterestScreenState();
}

class _CStartInterestScreenState extends State<CStartInterestScreen> {
  int? selectedInterest; // 選択された興味を保持する変数

  final List<String> interests = [
    'お絵描きをすること',
    '運動すること',
    '勉強すること',
    'たくさん寝ること',
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
          icon: const Icon(Icons.arrow_back, color: Colors.brown, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        toolbarHeight: 50,
      ),
      body: Stack(
        children: [
          // スクロール可能なコンテンツ
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.15),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 進捗バー
                    LinearProgressIndicator(
                      value: 0.5, // 50% 完了
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation(Color(0xFF1EC9A8)),
                      minHeight: 10,
                    ),
                    const SizedBox(height: 20),

                    // 質問テキストとキャラクター
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              '好きなことを教えてね',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/chara1.png',
                          height: 80,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 興味選択欄
                    ...List.generate(interests.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedInterest = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          decoration: BoxDecoration(
                            color: selectedInterest == index
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
                              interests[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
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

          // 固定のボタンと背景コンテナ
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
                  if (selectedInterest != null) {
                    // 次の画面へ遷移（必要なら追加）
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('好きなことを選択してください')),
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
