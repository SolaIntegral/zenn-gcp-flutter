import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/custom_button.dart';
import '../child/c_home_screen.dart'; // 2回目以降のログイン時の画面
import '../child/c_start_intro_screen.dart'; // 初回ログイン時の画面

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      String userId = userCredential.user!.uid;

      // Firestore からユーザー情報を取得
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(userId).get();

      bool isRegistered = userDoc.exists && (userDoc.data() as Map<String, dynamic>)['isRegistered'] == true;

      // 初回登録画面 or ホーム画面へ遷移
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isRegistered ? const CHomeScreen() : const CStartIntroScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('エラー: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          child: Column(
          children: [
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'メールアドレス')),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'パスワード'), obscureText: true),
            const SizedBox(height: 20),
            CustomButton(text: 'ログイン', onPressed: _login),
          ],
        ),
      ),
      ),
    );
  }
}
 