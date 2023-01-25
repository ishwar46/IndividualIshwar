import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/homepage.dart';

import '../widgets/internet_connection.dart';
import 'login_page.dart';

class CheckInternet extends StatelessWidget {
  CheckInternet({super.key});
  Connectivity connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Internet"),
      ),
      body: StreamBuilder<ConnectivityResult>(
        stream: connectivity.onConnectivityChanged,
        builder: (context, snapshot) {
          return InternetConnectionWidget(
            snapshot: snapshot,
            widget: HomePage(),
          );
        },
      ),
    );
  }
}
