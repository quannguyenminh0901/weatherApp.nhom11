import 'package:flutter/material.dart';
import 'package:weatherapp/templates/Congcu/item_page.dart';
import 'package:weatherapp/templates/Congcu/my_page.dart';
import 'package:weatherapp/templates/Congcu/search_page.dart';
import '../Test.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [Test(), BarItemPage(), SearchPage(), MyPage()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type:
              BottomNavigationBarType.fixed, //KÍCH THƯỚC K THAY ĐỔI KHI DC CHỌN
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex, //HIỂN THỊ TAB ANOF DC CHỌN
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          //showUnselectedLabels: false, //ẨN HIỆN TIÊU ĐÈ
          //showSelectedLabels: false, //ẨN HIỆN TIÊU ĐỀ
          elevation: 0,
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "Weather", icon: Icon(Icons.wb_sunny)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "My", icon: Icon(Icons.person)),
          ]),
    );
  }
}
