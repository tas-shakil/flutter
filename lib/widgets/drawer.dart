import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child:UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Shakil"),
                  accountEmail: Text("ss@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                )
            ),
            const ListTile(
              leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white
              ),
              title: Text(
                "Home",textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white
              ),
              title: Text(
                "Email Me",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

}

