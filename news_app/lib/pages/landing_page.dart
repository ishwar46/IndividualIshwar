import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile.dart';
import 'package:news_app/service/api_service.dart';

import '../models/article_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getArticles(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
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
    );
  }
}
