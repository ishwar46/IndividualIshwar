import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MakeRsTest extends StatefulWidget {
  MakeRsTest({super.key, required this.price});
  String price;

  @override
  State<MakeRsTest> createState() => _MakeRsTestState();
}

class _MakeRsTestState extends State<MakeRsTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text("Rs." + widget.price),
    );
  }
}
