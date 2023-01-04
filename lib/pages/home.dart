import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footic/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin{

  late TabController _tabController;
  int _selectedIndexBottom = 0;
  final List<Widget> _children = [
    Center(
      child: Container(
        child: Image.asset("assets/dispo.png"),
      ),
    ),
    Center(
      child: Container(
        child: Image.asset("assets/dispo.png"),
      ),
    ),
    Center(
      child: Container(
        child: Image.asset("assets/dispo.png"),
      ),
    ),
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
    _tabController = TabController(length: 6, vsync: this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.deepPurple,));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndexBottom == 0 ? PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0,left: 30.0,right: 30.0),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top:25.0,bottom: 8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.filter_list),
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),

                    ),
                  ),
                ),
              ),
            ),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.settings)),
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.settings)),
              ],
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.deepPurple,
              labelColor: Colors.deepPurple,
            ),
          ],
        ),
      ) : PreferredSize(
        preferredSize: Size.fromHeight(100),
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
      body: _selectedIndexBottom == 0 ? TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Container(
              child: Image.asset("assets/dispo.png"),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/dispo.png"),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/dispo.png"),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/dispo.png"),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/dispo.png"),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/dispo.png"),
            ),
          ),
        ],
      ) : _children[_selectedIndexBottom],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
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

