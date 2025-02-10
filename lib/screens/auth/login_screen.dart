import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            const Text(
              'ログイン',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 20),

            // メールアドレス・パスワード
            _buildTextField('メールアドレスを入力'),
            _buildTextField('パスワードを入力', isPassword: true),

            const SizedBox(height: 10),

            // 新規登録へのリンク
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signup'),
              child: const Text(
                '新規登録の方はこちら',
                style: TextStyle(color: Colors.brown, decoration: TextDecoration.underline),
              ),
            ),

            const SizedBox(height: 30),

            // ログインボタン
            Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF1EC9A8),
                onPressed: () {
                  Navigator.pushNamed(context, '/user_selection');
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
