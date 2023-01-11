import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawerNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final imageUrl =
        "https://avatars.githubusercontent.com/u/82198534?s=400&u=7b79a9ba91b72fdc4983200b7e4cb358fb4b3597&v=4";
    return Drawer(
      child: Container(
        color: Colors.purple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                margin: EdgeInsets.zero,
                accountName: Text(
                  "Welcome ${user!.email}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text("coolishu@hotmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.square_favorites,
                color: Colors.white,
              ),
              title: Text(
                "Favourites",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.book_circle,
                color: Colors.white,
              ),
              title: Text(
                "Magazines",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.square_stack_3d_up,
                color: Colors.white,
              ),
              title: Text(
                "Categories",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
