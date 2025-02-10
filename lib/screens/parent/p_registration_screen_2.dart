// parent_register.dart
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/parent/p_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PRegisterScreen2 extends StatefulWidget {
  const PRegisterScreen2({Key? key}) : super(key: key);

  @override
  State<PRegisterScreen2> createState() => _PRegisterScreen2State();
}

class _PRegisterScreen2State extends State<PRegisterScreen2> {
  int _currentStep = 0;

  // 例として2ステップの登録（ニックネーム登録、生年月日登録）
  final List<Step> _steps = [
    const Step(
      title: Text("ニックネーム登録"),
      content: TextField(
        decoration: InputDecoration(labelText: "ニックネーム"),
      ),
      isActive: true,
    ),
    const Step(
      title: Text("生年月日登録"),
      content: TextField(
        decoration: InputDecoration(labelText: "生年月日"),
      ),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "おうちの人-登録",
          style:
              TextStyle(color: Color(0xFF684B09), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFF2EEE9),
      ),
      backgroundColor: Color(0xFFF2EEE9),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () async {
          if (_currentStep < _steps.length - 1) {
            setState(() {
              _currentStep++;
            });
          } else {
            // 最終ステップで登録完了
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('isRegistered', 'p_registered');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const PHomeScreen()),
            );
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        steps: _steps,
      ),
    );
  }
}
