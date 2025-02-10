import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/custom_button.dart';
import '../child/c_start_intro_screen.dart'; // 初回登録時の画面

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signup() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      String userId = userCredential.user!.uid;

      // Firestore にユーザー情報を保存
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'registeredAt': FieldValue.serverTimestamp(),
        'isRegistered': false, // 初回登録フラグ
      });

      // 初回登録画面へ遷移
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CStartIntroScreen()),
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
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: '名前')),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'メールアドレス')),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'パスワード'), obscureText: true),
            const SizedBox(height: 20),
            CustomButton(text: '登録', onPressed: _signup),
          ],
        ),
      ),
    );
  }
}
