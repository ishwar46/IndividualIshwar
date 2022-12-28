import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProvinceNews extends StatefulWidget {
  const ProvinceNews({super.key});

  @override
  State<ProvinceNews> createState() => _ProvinceNewsState();
}

class _ProvinceNewsState extends State<ProvinceNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text("Province News"),
        ),
      ),
    );
  }
}
