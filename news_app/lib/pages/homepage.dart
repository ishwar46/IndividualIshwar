import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: GNav(
              backgroundColor: Colors.black,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.purple,
              iconSize: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              duration: const Duration(milliseconds: 800),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.new_releases_rounded,
                  text: 'Latest',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favourites',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: 0,
              onTabChange: (index) {
                print(index);
              },
            ),
          ),
        ),
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
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Image.asset("assets/images/logo.png"),
          actions: [
            IconButton(
              onPressed: () {
                SignUserOut();
              },
              icon: Icon(Icons.logout, color: Colors.black),
            )
          ],
          title: Text("Welcome ${user!.email}"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                //Navigation Bar
                TabBar(
                  isScrollable: true,
                  physics: BouncingScrollPhysics(),
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.purple,
                  indicatorColor: Colors.purple,
                  tabs: [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Latest",
                    ),
                    Tab(
                      text: "Popular",
                    ),
                    Tab(
                      text: "Province",
                    ),
                    Tab(
                      text: "Sports",
                    ),
                    Tab(
                      text: "Politics",
                    ),
                  ],
                ),
                //TabBarView
                // Expanded(
                //   child: TabBarView(children: [
                //     AllNews(),
                //     ProvinceNews(),
                //     PopularNews(),
                //   ]),
                // ),

                //List tiles for news

                //Navigation Bar
              ],
            ),
          ),
        ),
      ),
    );
  }
}
