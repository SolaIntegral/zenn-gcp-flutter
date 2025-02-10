// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'p_registration_screen.dart';
// import 'p_home_screen.dart';

// class PDay1Screen extends StatefulWidget {
//   const PDay1Screen({super.key});

//   @override
//   State<PDay1Screen> createState() => _PDay1ScreenState();
// }

// class _PDay1ScreenState extends State<PDay1Screen> {
//   bool _isChecking = true;
//   bool _isRegistered = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkRegistration();
//   }

//   Future<void> _checkRegistration() async {
//     final prefs = await SharedPreferences.getInstance();
//     // 登録完了フラグ（初回は存在しないので false）
//     _isRegistered = prefs.getBool('isRegistered') ?? false;
//     setState(() {
//       _isChecking = false;
//     });
//     if (!_isRegistered) {
//       // 未登録の場合は登録フローへ（pushReplacement で戻れなくする）
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const RegistrationScreen()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isChecking) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//     // 登録済みならおうちの人のホームページへ
//     return const PHomeScreen();
//   }
// }
