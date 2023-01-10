import 'package:flutter/material.dart';

import '../models/catalog.dart';
import '../models/news.dart';

class NewsWidget extends StatelessWidget {
  //final News news;
  final Item item;

  const NewsWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);
  //const NewsWidget({super.key, required this.news});

  // const NewsWidget({required Key key, required this.news})
  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.green,
      //shape: StadiumBorder(),
      //elevation: 0.0,
      // child: ListTile(
      //   onTap: () {
      //     print("${item.name} pressed");
      //   },
      //   leading: Image.network(item.image),
      //   title: Text(item.name),
      //   subtitle: Text(item.description),
      //   trailing: Text(
      //     "\$${item.price}",
      //     textScaleFactor: 1.2,
      //     style: TextStyle(
      //       color: Colors.green,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      child: GridTile(
        child: Image.network(item.image),
        footer: Container(
          color: Colors.white70,
          child: ListTile(
            leading: Text(
              item.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Text(
              item.name.toString(),
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: Text(
              item.description,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
