import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          User user = users[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 6.0),
                ],
              ),
              child: ClipOval(
                child: Image(
                  height: 60.0,
                  width: 60.0,
                  fit: BoxFit.cover,
                  image: AssetImage(user.profileImageUrl),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
