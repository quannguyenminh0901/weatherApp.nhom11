import 'package:flutter/material.dart';
import 'Congcu/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _currentPageIndex = 0;
  bool _showButton = false;

  List<String> _imagePaths = [
    "assets/img/timkiem.jpg",
    "assets/img/desudung.jpg",
    "assets/img/ttcx.jpg",
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
      _showButton = index == 2;
    });
  }

  void _onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: _imagePaths.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: ClipRRect(
                  child: Image.asset(
                    _imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          AnimatedPositioned(
            bottom: _showButton ? 16.0 : -60.0,
            right: 16.0,
            duration: Duration(milliseconds: 300),
            child: Container(
              height: 40.0,
              child: ElevatedButton(
                onPressed: _onButtonPressed,
                child: Text('Let\'s go'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
