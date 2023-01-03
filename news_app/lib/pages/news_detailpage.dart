import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/pages/homepage.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 20),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        newsItems[2].title!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset('assets/images/bipul.png'),
                      SizedBox(height: 20),
                      Text(
                        "shfsdhfbdjkcbsdkjcbdsjkcbjkdsbvckjdsbcjkdsbvkjsdcvgdusjv sjbsajbcsjabchdacadbciudbcjdbckjdbcjdskbcjkdbcjkdbcjskdbijjdsbiwbcidsbcdskbcjdskbdjskbckjdsbkjsdbjkdsbkjdsbkjdsbvkjdsbvjksdbvkjdsbvkjdjkhsjkasgcjksajkcsdabjkcgdakcgkjdsvcjkdsvcjkdsvcgjkdsvkjdsvcjkdsvckjsdvckjdsvckjdsvcjdksvckjdsvckjdsvckjdsvcdjskcvjkdsvcjkdsvcsdkjcvjkdbsbkvjbdskjvbdskjvbksdjbvkjdsbvjkdsbvdsbvkdnskvdsbkvndsbkjvbdskjbvjksdnvkldsvkdscsdkjvcjdsvcjfdshvckjdsvcdsuvckudsgvudsvbkjdscvbdsukjbcdskcgsdkjcbdskjcgbdkjsbckjdsijsehfiwehfiewfiewfiuewgfigewufgewuifgweiufgewiugfuiewgfiuewgfiuewgfiuewgfewgfewygfiewgiewugfiuewgfiuewgfuewgfiuewgfuiewgfuiewgfuiwegfiuewgfiugfuiweegfuiewgfuiewgfuiewgfiuewgfiuewgfiuewgfiuwegghdfsdfdsjfbsdjfhjsdvfhfgweufgweugfibusdbfuidsbdsbdsjbcjkdsbcuwegfuwegfiuewbfisdbjidsbcjksdbciwebufiweuifbdsibcisdbciuwebfiuewbuibcuidbciudbiuwbviuwrbiubvuibviubvuibcbuibddivbbvfdbvuifdvbidu",
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Related News",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 200,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.asset('assets/images/bipul.png'),
                                  Text(
                                    newsItems[index].title!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
