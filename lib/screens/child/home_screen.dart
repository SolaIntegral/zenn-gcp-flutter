import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'chat_screen.dart'; // 次の遷移先
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // 日付計算用

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "なまえ";
  int daysSinceStart = 0;
  int level = 1;
  int daysUntilNextLevel = 5;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

Future<void> _fetchUserData() async {
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  try {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    DocumentSnapshot charDoc =
        await FirebaseFirestore.instance.collection('character').doc(userId).get();

    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      setState(() {
        userName = userData['name'] ?? "なまえ";

        // Firestore の `registeredAt` から育成日数を計算
        if (userData.containsKey('registeredAt')) {
          Timestamp registeredAt = userData['registeredAt'];
          DateTime registeredDate = registeredAt.toDate();
          daysSinceStart = DateTime.now().difference(registeredDate).inDays;
        } else {
          daysSinceStart = 1; // デフォルト値
        }
      });
    }

    if (charDoc.exists) {
      Map<String, dynamic> charData = charDoc.data() as Map<String, dynamic>;

      setState(() {
        // Firestore の `level` を優先
        level = charData.containsKey('level')
            ? charData['level']
            : (daysSinceStart ~/ 5) + 1;

        // 次のレベルアップまでの日数を計算
        daysUntilNextLevel = 5 - (daysSinceStart % 5);
      });
    }
  } catch (e) {
    debugPrint("エラー: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('データ取得に失敗しました。')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 上部の背景部分
          Container(
            width: double.infinity,
            height: screenHeight * 0.25,
            color: const Color(0xFF1EC9A8),
          ),

          // キャラクター画像
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.1),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: screenWidth * 0.2,
              child: Image.asset(
                'lib/assets/chara1.png',
                height: screenHeight * 0.2,
              ),
            ),
          ),

          // 名前の表示
          Text(
            userName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
          ),

          SizedBox(height: screenHeight * 0.02),

          // 育成日数表示
          Container(
            width: screenWidth * 0.8,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Column(
              children: [
                _buildTextRow('育て始めてから', '$daysSinceStart日'),
                _buildTextRow('現在のレベル', 'Lv.$level'),
                _buildTextRow('大きくなるまであと', '$daysUntilNextLevel日'),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          // 「おはなししにいく」ボタン
          CustomButton(
            text: 'おはなししにいく',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              );
            },
          ),

          const Spacer(),

          // 「育てたことのあるキャラクター」テキスト
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: const Text(
              '育てたことのあるキャラクター',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextRow(String leftText, String rightText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: const TextStyle(fontSize: 16, color: Colors.brown, fontWeight: FontWeight.w500),
          ),
          Text(
            rightText,
            style: const TextStyle(fontSize: 18, color: Colors.brown, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
