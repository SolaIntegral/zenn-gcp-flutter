import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/parent/p_record.dart';
import 'package:flutter_app1/widgets/custom_base.dart';

class PHomeScreen extends StatelessWidget {
  const PHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return CustomBase(
      title: 'Home',
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1, vertical: screenWidth * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //今日の記録&ログイン日数box
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PRecordScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // 背景を白に設定
                    fixedSize: Size(screenWidth * 0.48,
                        screenWidth * 0.48), // 正方形のサイズ（例：100×100）
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0), // 角を丸く（例：16）
                      side: const BorderSide(
                          width: 2, color: Colors.brown), // 茶色のボーダー
                    ),
                    elevation: 4, // 必要に応じて影の設定（ここでは無くしています）
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.book_outlined,
                        color: Colors.brown,
                        size: screenWidth * 0.2,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "今日の記録",
                        style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w900,
                            fontSize: 24),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.08,
                ),
                Container(
                  height: screenWidth * 0.27,
                  width: screenWidth * 0.24,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2EEE9),
                    border: Border.all(
                      color: Colors.brown, // ボーダーの色
                      width: 1.0, // ★ ボーダーの太さを1pxに設定
                    ),
                    borderRadius: BorderRadius.circular(6.0), // ★ 角を丸く（16px）
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ログイン日数",
                        style: TextStyle(
                            color: Color(0xFF684B09),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                            color: Color(0xFF684B09),
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "日目",
                        style: TextStyle(
                            color: Color(0xFF684B09),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: screenWidth * 0.07),
            //帰宅時間box
            Container(
              height: screenWidth * 0.3,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                border: Border.all(
                  color: Color(0xFFB6C1C5), // ボーダーの色
                  width: 1.0, // ★ ボーダーの太さを1pxに設定
                ),
                borderRadius: BorderRadius.circular(6.0), // ★ 角を丸く（16px）
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.08),
                        child: const Text(
                          "今日の帰宅時間",
                          style: TextStyle(
                              color: Color(0xFF684B09),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "16:30",
                        style: TextStyle(
                            color: Color(0xFF684B09),
                            fontSize: 48,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.11),
                        child: const Text(
                          "前回の帰宅時間",
                          style: TextStyle(
                              color: Color(0xAA684B09),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "15:45",
                        style: TextStyle(
                            color: Color(0xAA684B09),
                            fontSize: 26,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 34, bottom: 12),
              child: Text(
                "放課後の予定",
                style: TextStyle(
                    color: Color(0xFF684B09),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: screenWidth * 0.18,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                border: Border.all(
                  color: Color(0xFFB6C1C5), // ボーダーの色
                  width: 2.0, // ★ ボーダーの太さを1pxに設定
                ),
                borderRadius: BorderRadius.circular(12.0), // ★ 角を丸く（16px）
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.08),
                        child: const Text(
                          "塾に行く",
                          style: TextStyle(
                              color: Color(0xFF684B09),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "16:30に入力されました",
                        style: TextStyle(
                            color: Color(0xFF684B09),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      currentIndex: 1,
    );
  }
}
