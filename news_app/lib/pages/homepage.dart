import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/pages/drawer.dart';

import '../main.dart';
import '../models/news_model.dart';
import 'news_detailpage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //method for notification
  void showNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "channelId",
      "channelName",
      importance: Importance.max,
      priority: Priority.max,
      ticker: "test",
      enableLights: true,
      enableVibration: true,
    );

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      "Satya Ke Khoji",
      "Welcome to Satya Ke Khoji",
      notificationDetails,
    );

    DateTime time = DateTime.now().add(Duration(seconds: 5));
    //time based notification
    await flutterLocalNotificationsPlugin.schedule(
        0, "test", "testing ishu", time, notificationDetails,
        payload: "test");
  }

  final user = FirebaseAuth.instance.currentUser;

  void SignUserOut() async {
    await FirebaseAuth.instance.signOut(
        //show loading dialog
        );
  }

//App launch notification
  void checkForNotification() async {
    NotificationAppLaunchDetails? details =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null) {
      if (details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => NewsDetails(),
        //   ),
        // );
        if (response != null) {
          String? payload = response.payload;
          log("Noitification payload: $payload");
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => NewsDetails(),
          //     ),
          //   );
          // }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkForNotification();
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
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  //Navigator
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(),
                      ),
                    );
                  },
                ),
                GButton(
                  icon: Icons.new_releases_rounded,
                  text: 'Latest',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Notifi',
                  onPressed: showNotification,
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
          child: MyDrawer(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Image.asset("assets/images/logo.png"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                "Hello " + user!.email!,
                style: TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Sign Out"),
                        content: Text("Are you sure you want to sign out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              SignUserOut();
                              Navigator.pop(context);
                            },
                            child: Text("Sign Out"),
                          ),
                        ],
                      );
                    });
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
              children: [
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
                SizedBox(height: 10),
                //GridView
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: newsItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          // Row(
                          //   children: [
                          //     Icon(Icons.lock_clock_outlined),
                          //   ],
                          // ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     IconButton(
                          //       onPressed: () {
                          //         // //if pressed change the color of the icon
                          //         // if (newsItems[index].isFavourite) {
                          //         //   setState(() {
                          //         //     newsItems[index].isFavourite = false;
                          //         //   });
                          //         // } else {
                          //         //   setState(() {
                          //         //     newsItems[index].isFavourite = true;
                          //         //   });
                          //         // }
                          //       },
                          //       icon: Icon(Icons.favorite_border_outlined),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            newsItems[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(height: 10),

                          Image.asset('assets/images/bipul.png'),

                          //Image.network(newsItems[index].imageUrl),

                          SizedBox(height: 10),
                          Text(newsItems[index].description),
                        ],
                      ),
                    );
                  },
                ),
                //Navigation Bar

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
