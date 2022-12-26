import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  void SignUserOut() async {
    await FirebaseAuth.instance.signOut(
        //show loading dialog
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Welcome ${user!.email}"),
            ),
            ListTile(
              title: Text("Item 1"),
            ),
            ListTile(
              title: Text("Item 2"),
            ),
            ListTile(
              title: Text("Item 3"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              SignUserOut();
            },
            icon: Icon(Icons.logout),
          )
        ],
        title: Text("Welcome ${user!.email}"),
      ),
      body: Container(
        child: Center(
          child: Text("Welcome ${user!.email}"),
          //Button
        ),
      ),
    );
  }
}
