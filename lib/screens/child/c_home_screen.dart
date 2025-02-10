import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'c_day1_screen.dart';  // 遷移先の画面をインポート
import 'package:cloud_firestore/cloud_firestore.dart';

class CHomeScreen extends StatefulWidget {
  const CHomeScreen({super.key});

  @override
  State<CHomeScreen> createState() => _CHomeScreenState();
}

class _CHomeScreenState extends State<CHomeScreen> {
  String userName = "なまえ";
  int loginDays = 1;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    String userId = "user123"; // TODO: Firebase Authentication で取得

    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      setState(() {
        userName = userData['name'] ?? "なまえ";

        // Firestore の `registeredAt` からログイン日数を計算
        Timestamp registeredAt = userData['registeredAt'];
        DateTime registeredDate = registeredAt.toDate();
        loginDays = DateTime.now().difference(registeredDate).inDays + 1;
      });
    }
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
      body: Column(
        children: [
          // 上部のテキスト部分
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$userName、おかえり！',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08, // 画面幅に応じたフォントサイズ
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Image.asset(
                    'lib/assets/chara1.png',  // 画像の追加
                    height: screenHeight * 0.2, // 画面高さの20%に調整
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),

          // 下部の緑背景部分
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: const Color(0xFF1EC9A8), // 緑色の背景
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$loginDays 日目',
                    style: TextStyle(
                      fontSize: screenWidth * 0.12, // 画面幅に応じたフォントサイズ
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomButton(
                    text: 'ただいま！',
                    onPressed: () {
                      // 次の画面へ遷移
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CDay1Screen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
