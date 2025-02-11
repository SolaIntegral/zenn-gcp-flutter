// custom_base.dart
import 'package:flutter/material.dart';

class CustomBase extends StatelessWidget {
  final String title;
  final Widget body;
  final int currentIndex;

  const CustomBase({
    Key? key,
    required this.title,
    required this.body,
    this.currentIndex = 1,
  }) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/event');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
              color: Color(0xFF684B09), fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF2EEE9),
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, index),
        selectedItemColor: const Color(0xFF684B09),
        unselectedItemColor: Colors.grey,
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
