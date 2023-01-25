import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app/pages/homepage.dart';
import 'package:news_app/pages/login_page.dart';
import 'package:news_app/pages/profile.dart';

//Global variable for the notification plugin
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/logo');

  DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (id, title, body, payload) async {},
  );

  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);

//background notification
  bool? initialized = await flutterLocalNotificationsPlugin.initialize(
      initializationSettings, onDidReceiveNotificationResponse: (response) {
    log(response.payload.toString());
  });

  log("Notofication: $initialized");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Satya Ke Khoji',
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: "/splash",
      routes: {
        "/": (context) => SplashScreen(),
        "/home": (context) => HomePage(),
        "/splash": (context) => const SplashScreen(),
        "/profile": (context) => const MyProfile(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/applogo.png',
                width: 400,
                height: 400,
              ),
            ],
          ),
        ));
  }
}

class MyRoutes {
  String splashRoute = "/splash";
  String homeRoute = "/home";
  String profileRpute = "/profile";
}
