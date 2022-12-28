import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PopularNews extends StatefulWidget {
  const PopularNews({super.key});

  @override
  State<PopularNews> createState() => _PopularNewsState();
}

class _PopularNewsState extends State<PopularNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text("Popular News"),
        ),
      ),
    );
  }
}
