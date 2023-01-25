import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({super.key, required this.article, String? author});
  final Article article;

  @override
  Widget build(BuildContext context) {
    print(article.content);
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
                      image: CachedNetworkImageProvider(article.urlToImage!),
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
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                article.title!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            SizedBox(height: 10.0),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ExpandableText(
                article.content!,
                expandText: 'show more',
                collapseText: 'show less',
                maxLines: 3,
                linkColor: Colors.blue,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            //Text(article.publishedAt),
            SizedBox(height: 20.0),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: InkWell(
                    child: Text(
                      "Read Full Article",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      launchUrlStart(url: article.url!);
                    },
                  ),
                ),
                //Text
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: Text(
                    "More News:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//wideget for lunch url

void launchUrlStart({required String url}) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
