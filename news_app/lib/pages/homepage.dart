import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart';
import 'package:news_app/pages/drawer.dart';
import 'dart:convert';

import '../components/news_tile.dart';
import '../main.dart';
import '../models/article_model.dart';
import '../models/catalog.dart';
//import '../widgets/news_widget.dart';
import '../service/api_service.dart';
import 'news_detailpage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  final user = FirebaseAuth.instance.currentUser;

  //User SignOut
  void SignUserOut() async {
    await FirebaseAuth.instance.signOut(
        //show loading dialog
        );
  }

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

    //for ios
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
    await flutterLocalNotificationsPlugin.schedule(0, "Breaking News",
        "Balen Shah Files Case in Supreme Court.", time, notificationDetails,
        payload: "ok");
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

  //Data form json file
  loadData() async {
    // await Future.delayed(Duration(seconds: 2));
    // var newsJson = await rootBundle.loadString("assets/files/news.json");
    // var decodedData = jsonDecode(newsJson);
    // var newsData = decodedData["newsData"];
    // NewsModel.newsDetails =
    //     List.from(newsData).map<News>((item) => News.fromMap(item)).toList();
    // setState(() {});
    await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/newsnew.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkForNotification();
    loadData();
    showNotification();
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
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                const GButton(
                  icon: Icons.new_releases_rounded,
                  text: 'Latest',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Notifi',
                  onPressed: showNotification,
                ),
                const GButton(
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
        body: FutureBuilder(
          future: client.getArticles(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) =>
                    newsTile(articles[index], context),
              );
            }
            return Center(
              child: CupertinoActivityIndicator(
                radius: 15,
              ),
            );
          },
        ),
        // body: SafeArea(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: const [
        //         TabBar(
        //           isScrollable: true,
        //           physics: BouncingScrollPhysics(),
        //           unselectedLabelColor: Colors.black,
        //           labelColor: Colors.purple,
        //           indicatorColor: Colors.purple,
        //           tabs: [
        //             Tab(
        //               text: "All",
        //             ),
        //             Tab(
        //               text: "Latest",
        //             ),
        //             Tab(
        //               text: "Popular",
        //             ),
        //             Tab(
        //               text: "Province",
        //             ),
        //             Tab(
        //               text: "Sports",
        //             ),
        //             Tab(
        //               text: "Politics",
        //             ),
        //           ],
        //         ),
        //         SizedBox(height: 10),
        //         //Widegt for newsTile
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
