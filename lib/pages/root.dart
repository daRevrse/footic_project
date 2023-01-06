import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footic/pages/explore.dart';
import 'package:footic/pages/home.dart';
import 'package:footic/pages/profile.dart';
import 'package:footic/pages/settings.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with SingleTickerProviderStateMixin{

  int _selectedIndexBottom = 0;
  final List<Widget> _children = [
    HomePage(),
    ExplorePage(),
    SettingsPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexBottom = index;
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.deepPurple,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Padding(
          padding: EdgeInsets.only(top: 30.0,left: 30.0,right: 30.0),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top:25.0,bottom: 8.0),
              child: Container(),
            ),
          ),
        ),
      ),
      body: _children[_selectedIndexBottom],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndexBottom,
        onTap: _onItemTapped,
      ),
    );
  }
}

