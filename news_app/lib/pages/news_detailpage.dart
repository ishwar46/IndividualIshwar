import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:news_app/models/article_model.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({super.key, required this.article, String? author});
  final Article article;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //Notification Icon button
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],

        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(bottom: 16, top: 8, left: 10, right: 10),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(article.urlToImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text("Posted by: " + article.author!),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.bookmark),
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: 10.0),
            Text(
              article.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Wrap(
              children: <Widget>[
                Text(
                  article.content!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            //Text(article.publishedAt),
            SizedBox(height: 10.0),
            Column(
              children: [
                InkWell(child: Text("Read more at: " + article.url!)
                    //onTap: () => launch(article.url!),
                    ),
                //Text
                Container(
                  margin: EdgeInsets.all(0),
                  child: Text("Releated News:"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
