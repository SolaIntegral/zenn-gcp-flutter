import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/parent/p_registration_screen_2.dart';
import 'package:flutter_app1/widgets/custom_base.dart';

class PRecordScreen extends StatelessWidget {
  const PRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final Color whiteColor = Colors.white;
    final Color grayColor = Colors.grey[200]!;

    return CustomBase(
      title: '今日の記録',
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1,
            vertical: screenWidth * 0.04,
          ),
          child: Column(
            children: [
              Container(
                height: screenWidth * 0.27,
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2EEE9),
                  border: Border.all(
                    color: Colors.brown, // ボーダーの色
                    width: 1.0, // ★ ボーダーの太さを1pxに設定
                  ),
                  borderRadius: BorderRadius.circular(6.0), // ★ 角を丸く（16px）
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "登校時間",
                          style: TextStyle(
                              color: Color(0xFF684B09),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "7:45",
                          style: TextStyle(
                              color: const Color(0xFF684B09),
                              fontSize: screenWidth * 0.08,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(width: screenWidth * 0.20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "帰宅時間",
                          style: TextStyle(
                              color: Color(0xFF684B09),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "16:30",
                          style: TextStyle(
                              color: const Color(0xFF684B09),
                              fontSize: screenWidth * 0.08,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.08),
              ListView(
                shrinkWrap: true, // 必要な分だけ高さを取る（親がスクロール可能なら不要）
                physics:
                    const NeverScrollableScrollPhysics(), // スクロールさせたくなければ（内容が収まるなら）
                children: [
                  // Box 1 (白)
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: screenWidth * 0.19),
                    child: Container(
                      width: screenWidth * 0.8,
                      // color: whiteColor,
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.04,
                          right: screenWidth * 0.1,
                          top: screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(
                          color: Color.fromARGB(255, 153, 158, 160), // ボーダーの色
                          width: 1, // ★ ボーダーの太さを1pxに設定
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "今日の気分",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "ふつう",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Box 2 (グレー)
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: screenWidth * 0.19),
                    child: Container(
                      width: screenWidth * 0.8,
                      // color: whiteColor,
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.04,
                          right: screenWidth * 0.1,
                          top: screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: grayColor,
                        border: Border.all(
                          color: Color.fromARGB(255, 153, 158, 160), // ボーダーの色
                          width: 1, // ★ ボーダーの太さを1pxに設定
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ひとこと",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "記入なし",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Box 3 (白)
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: screenWidth * 0.19),
                    child: Container(
                      width: screenWidth * 0.8,
                      // color: whiteColor,
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.04,
                          right: screenWidth * 0.1,
                          top: screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(
                          color: Color.fromARGB(255, 153, 158, 160), // ボーダーの色
                          width: 1, // ★ ボーダーの太さを1pxに設定
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "宿題",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "漢字ドリル",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Box 4 (グレー)
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: screenWidth * 0.19),
                    child: Container(
                      width: screenWidth * 0.8,
                      // color: whiteColor,
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.04,
                          right: screenWidth * 0.1,
                          top: screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: grayColor,
                        border: Border.all(
                          color: Color.fromARGB(255, 153, 158, 160), // ボーダーの色
                          width: 1, // ★ ボーダーの太さを1pxに設定
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "プリント",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "なし",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: screenWidth * 0.19),
                    child: Container(
                      width: screenWidth * 0.8,
                      // color: whiteColor,
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.04,
                          right: screenWidth * 0.1,
                          top: screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(
                          color: Color.fromARGB(255, 153, 158, 160), // ボーダーの色
                          width: 1, // ★ ボーダーの太さを1pxに設定
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "予定",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "塾に行く",
                            style: TextStyle(
                                color: Color(0xFF684B09),
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      currentIndex: 1,
    );
  }
}
