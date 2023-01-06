import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.0,right: 30.0),
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
      ),
      body: TabBarView(
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
      ),
    );
  }
}
