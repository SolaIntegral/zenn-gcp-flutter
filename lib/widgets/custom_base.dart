import 'package:flutter/material.dart';

class CustomBase extends StatelessWidget {
  /// AppBar のタイトルテキスト
  final String title;

  /// 各ページのコンテンツを受け取る
  final Widget body;

  /// 現在選択されているボトムナビゲーションバーのインデックス
  /// デフォルトは中央（ホーム）の 1 を指定
  final int currentIndex;

  const CustomBase({
    Key? key,
    required this.title,
    required this.body,
    this.currentIndex = 1,
  }) : super(key: key);

  /// ボトムナビゲーションバーのボタンがタップされたときの処理
  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        // チャットページへ遷移
        Navigator.pushReplacementNamed(context, '/chat');
        break;
      case 1:
        // ホームページへ遷移
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 2:
        // イベントページへ遷移
        Navigator.pushReplacementNamed(context, '/event');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 全体の背景色を白に設定
      backgroundColor: Colors.white,
      appBar: AppBar(
        // 渡されたタイトルテキストを表示
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white, // AppBar の背景色を白に設定
        elevation: 0, // 影を無くす
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF2EEE9),
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, index),
        // 選択中のアイコンとラベルの色を茶色に設定
        selectedItemColor: const Color(0xFF684B09),
        // 未選択のアイコンとラベルの色をグレーに設定
        unselectedItemColor: Colors.grey,
        // ラベルのテキストスタイルも明示的に設定（必要に応じて）
        selectedLabelStyle: const TextStyle(color: Color(0xFF684B09)),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_outlined,
              size: 40.0,
            ),
            label: 'チャット',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 40.0,
            ),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_border_rounded,
              size: 40.0,
            ),
            label: 'イベント',
          ),
        ],
      ),
    );
  }
}
