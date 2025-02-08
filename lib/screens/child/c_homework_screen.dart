import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'c_plan_screen.dart'; // 次の画面へ遷移

class CHomeworkScreen extends StatefulWidget {
  const CHomeworkScreen({super.key});

  @override
  State<CHomeworkScreen> createState() => _CHomeworkScreenState();
}

class _CHomeworkScreenState extends State<CHomeworkScreen> {
  bool? hasHomework;
  bool? hasPrint;
  final TextEditingController homeworkController = TextEditingController();
  final TextEditingController printController = TextEditingController();

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
          icon: Icon(Icons.arrow_back,
              color: Colors.brown, size: screenWidth * 0.08),
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
                      value: 0.75,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation(Color(0xFF1EC9A8)),
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
                              '宿題とプリントはあるかな？',
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
                          'assets/chara1.png',
                          height: screenHeight * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // 宿題
                    _buildSection(
                      title: '宿題',
                      value: hasHomework,
                      onChanged: (val) => setState(() => hasHomework = val),
                      controller: homeworkController,
                      hintText: '宿題を入力する',
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // プリント
                    _buildSection(
                      title: 'プリント',
                      value: hasPrint,
                      onChanged: (val) => setState(() => hasPrint = val),
                      controller: printController,
                      hintText: 'プリントを入力する',
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
                    MaterialPageRoute(
                        builder: (context) => const CPlanScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required bool? value,
    required Function(bool?) onChanged,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.brown,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            _buildRadioOption('ある', true, value, onChanged),
            const SizedBox(width: 20),
            _buildRadioOption('ない', false, value, onChanged),
          ],
        ),
        if (value == true)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration.collapsed(hintText: hintText),
            ),
          ),
      ],
    );
  }

  Widget _buildRadioOption(String label, bool optionValue, bool? selectedValue,
      Function(bool?) onChanged) {
    return GestureDetector(
      onTap: () => onChanged(optionValue),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selectedValue == optionValue
              ? const Color(0xFF1EC9A8).withOpacity(0.2)
              : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              selectedValue == optionValue
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selectedValue == optionValue
                  ? const Color(0xFF1EC9A8)
                  : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
