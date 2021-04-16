// import 'package:line_icons/line_icons.dart';

import 'package:flutter/material.dart';

import 'hal3.dart';

// import './main.dart';

void main() {
  runApp(LandingPage());
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new Hal3(),
    new Hal3(),
    new Hal3(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: Appbarcs(),
        body: _container[_bottomNavCurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF1b1c1e),
          onTap: (index) {
            setState(() {
              _bottomNavCurrentIndex = index;
            });
          },
          currentIndex: _bottomNavCurrentIndex,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.apps_outlined,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.apps_outlined,
                color: Colors.grey,
              ),
              title: Text('Keypad',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 0
                          ? Colors.white
                          : Colors.grey)),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.call,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.call,
                color: Colors.grey,
              ),
              title: Text('Terbaru',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 1
                          ? Colors.white
                          : Colors.grey)),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.contact_page,
                color: Colors.blue,
              ),
              icon: new Icon(
                Icons.contact_page,
                color: Colors.grey,
              ),
              title: new Text('Kontak',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 3
                          ? Colors.white
                          : Colors.grey)),
            ),
          ],
        ));
  }
}
