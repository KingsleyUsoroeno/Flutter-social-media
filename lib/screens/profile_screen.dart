import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/post_carousel.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _postController = PageController(initialPage: 0, viewportFraction: 0.8);
  final _favouriteController = PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image(
                  height: 300.0,
                  width: double.infinity,
                  image: AssetImage(widget.user.backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
                // align these iconButton to the top-left in the stack widget parent
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.black45, offset: Offset(0, 2), blurRadius: 6.0)]),
                    child: ClipOval(
                      child: Image(
                        width: 120.0,
                        height: 120.0,
                        image: AssetImage(widget.user.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(widget.user.name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Following', style: TextStyle(color: Colors.black, fontSize: 22.0)),
                    SizedBox(height: 2.0),
                    Text(widget.user.following.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w600)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Followers', style: TextStyle(color: Colors.black, fontSize: 22.0)),
                    SizedBox(height: 2.0),
                    Text(widget.user.followers.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
            PostCarousel(
              pageController: _postController,
              title: "Your Post",
              posts: widget.user.posts,
            ),
            PostCarousel(
              pageController: _favouriteController,
              title: "Favourites",
              posts: widget.user.favorites,
            ),
            SizedBox(height: 50.0)
          ],
        ),
      ),
    );
  }
}
