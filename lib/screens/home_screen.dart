import 'package:exam_dudee/screens/check_screen.dart';
import 'package:exam_dudee/screens/home_page_screen.dart';
import 'package:exam_dudee/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    CheckScreen(),
    NotificationScreen()
  ];
  List _namepage = ['Home', 'Check', 'Notification'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      index == 1
          ? Get.snackbar('trick', 'Tap Icon to Information',
              colorText: (Color.fromARGB(255, 22, 56, 61)),
             
              snackPosition: SnackPosition.TOP)
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0), // here the desired height
          child: AppBar(
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 47, 149, 162),
              title: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icon03.png',
                      ),
                      Text('CheckWash!',
                          style: TextStyle(
                              fontFamily: 'fonts1',
                              fontWeight: FontWeight.bold))
                    ],
                  ))),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomNavigationBar(
              elevation: 12,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_laundry_service_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: '',
                ),
              ],
              iconSize: 30,
              selectedFontSize: 1,
              unselectedFontSize: 1,
              backgroundColor: Color.fromARGB(255, 47, 149, 162),
              currentIndex: _selectedIndex,
              selectedItemColor: Color.fromARGB(255, 255, 255, 255),
              onTap: _onItemTapped),
        ));
  }
}
