import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../pages/no_connection.dart';

class InternetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult>? snapshot;
  final Widget widget;
  const InternetConnectionWidget(
      {super.key, required this.snapshot, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (snapshot!.connectionState) {
      case ConnectionState.none:
        return NoConnection();
      case ConnectionState.waiting:
        return const Center(child: CircularProgressIndicator());
      case ConnectionState.active:
        if (snapshot!.data == ConnectivityResult.none) {
          return const Center(child: Text("No Internet Connection"));
        }
        return widget;
      case ConnectionState.done:
        if (snapshot!.data == ConnectivityResult.none) {
          return const Center(child: Text("No Internet Connection"));
        }
        return widget;
    }
  }
}
