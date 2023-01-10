import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({super.key, required this.article, String? author});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Image.network(article.urlToImage!),
            Text(article.title!),
            Text(article.description!),
            Text(article.content!),
            Text(article.author!),
            //Text(article.publishedAt),
            Text(article.source!.name!),
          ],
        ),
      ),
    );
  }
}
