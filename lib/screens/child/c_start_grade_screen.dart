import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'c_start_interest_screen.dart';  // 追加
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore をインポート

class CStartGradeScreen extends StatefulWidget {
  final String userId;

  const CStartGradeScreen({super.key, required this.userId});

  @override
  State<CStartGradeScreen> createState() => _CStartGradeScreenState();
}

class _CStartGradeScreenState extends State<CStartGradeScreen> {
  int? selectedGrade; // 選択された学年を保持する変数

  final List<String> grades = [
    '小学1年生',
    '小学2年生',
    '小学3年生',
    '小学4年生',
    '小学5年生',
    '小学6年生',
  ];
    final TextEditingController nameController = TextEditingController(); // 名前入力用

  Future<void> _saveGrade(String selectedGrade) async {
  await FirebaseFirestore.instance.collection('users').doc(userId).update({
    'grade': selectedGrade,
  });

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const CStartInterestScreen()),
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
                      value: 0.25, // 25% 完了
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation(Color(0xFF1EC9A8)),
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
                              'きみの名前とがくねんを教えてね',
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
                          'lib/assets/chara1.png',
                          height: 80,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 名前入力欄
                    const Text(
                      '名前',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: nameController, // コントローラーを適用
                      decoration: InputDecoration(
                        hintText: '名前を入力してください',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 学年選択欄
                    const Text(
                      'がくねん',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(grades.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGrade = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                          child: Row(
                            children: [
                              Icon(
                                selectedGrade == index
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: selectedGrade == index
                                    ? const Color(0xFF1EC9A8)
                                    : Colors.grey,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                grades[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
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
                onPressed: _saveInfo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
