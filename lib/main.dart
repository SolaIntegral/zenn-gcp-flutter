// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/auth/role_selection_screen.dart';
import 'package:flutter_app1/screens/child/c_home_screen.dart';
import 'package:flutter_app1/screens/parent/p_welcomeback_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // 登録済みなら、"c_registered" または "p_registered" が格納されている
  final isRegistered = prefs.getString('isRegistered');

  Widget homeWidget;
  if (isRegistered == null) {
    // 未登録の場合はロール選択画面へ
    homeWidget = const RoleSelectionScreen();
  } else if (isRegistered == 'c_registered') {
    homeWidget = const CHomeScreen(
      //子供のおかえり画面
      //TODO:一旦仮置き
      userName: 'あい',
      loginDays: 10,
    );
  } else if (isRegistered == 'p_registered') {
    //親のおかえり画面
    homeWidget = const PWelcomebackScreen();
  } else {
    // 万が一（不正な値が入っていた場合）はロール選択画面を表示
    homeWidget = const RoleSelectionScreen();
  }

  runApp(MyApp(homeWidget: homeWidget));
}

class MyApp extends StatelessWidget {
  final Widget homeWidget;
  const MyApp({Key? key, required this.homeWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ユーザ選択アプリ',
      debugShowCheckedModeBanner: false,
      home: homeWidget,
    );
  }
}
