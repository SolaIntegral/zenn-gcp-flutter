import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'home_screen.dart'; // 次の遷移先
import 'package:cloud_firestore/cloud_firestore.dart';

class CToHomeScreen extends StatefulWidget {
  const CToHomeScreen({super.key});

  @override
  State<CToHomeScreen> createState() => _CToHomeScreenState();
}


class _CToHomeScreenState extends State<CToHomeScreen> {
  String characterName = "キャラ名";
  int daysSinceStart = 1;

  @override
  void initState() {
    super.initState();
    _fetchCharacterData();
  }

  Future<void> _fetchCharacterData() async {
    String userId = "user123"; // TODO: Firebase Authentication で取得する

    DocumentSnapshot charDoc =
        await FirebaseFirestore.instance.collection('character').doc(userId).get();
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (charDoc.exists && userDoc.exists) {
      Map<String, dynamic> charData = charDoc.data() as Map<String, dynamic>;
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      setState(() {
        characterName = charData['name'] ?? "キャラ名";

        // Firestore の `registeredAt` から育成日数を計算
        Timestamp registeredAt = userData['registeredAt'];
        DateTime registeredDate = registeredAt.toDate();
        daysSinceStart = DateTime.now().difference(registeredDate).inDays + 1;
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
      body: Stack(
        children: [
          // コンテンツ部分
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.15),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // キャラクター画像
                    Image.asset(
                      'lib/assets/chara1.png',
                      height: screenHeight * 0.3,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // 「おかえり！」テキスト
                     Text(
                      '$characterName に会えたね！',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // 日数表示
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02, horizontal: screenWidth * 0.1),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1EC9A8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '$daysSinceStart 日目',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
