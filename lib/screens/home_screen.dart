import 'package:flutter/material.dart';
import 'package:flutter_social_ui/screens/latest_post_screen.dart';
import 'package:flutter_social_ui/screens/trending_screen.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text('Frenzy',
            style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30.0, fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          indicatorWeight: 3.0,
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          tabs: <Widget>[
            Tab(text: "Trending"),
            Tab(text: "Latest"),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[TrendingScreen(), LatestPostScreen()],
      ),
    );
  }
}
