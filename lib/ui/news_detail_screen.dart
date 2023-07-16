import 'package:app_news/common/styles.dart';
import 'package:app_news/model/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_flags_svg/flutter_circle_flags_svg.dart';

class NewsDetailArgs {
  final Article article;

  const NewsDetailArgs({
    required this.article,
  });
}

class NewsDetailScreen extends StatefulWidget {
  static const routeName = "news_detail_screen";

  final Article article;
  const NewsDetailScreen({required this.article});

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetailScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Article Detail',
            style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: mediumBlue,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: whiteBackground,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Change Country'))),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1),
                  color: whiteBackground),
              width: 45,
              margin:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
              child: CircleFlag(
                'us',
                size: 40,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: "Markets"),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "CNBC TV"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Watchlist"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu")
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                color: mediumBlue,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/CNBC-Symbol.png',
                        width: 110,
                      ),
                      GestureDetector(
                          child: Icon(
                            Icons.search,
                            color: whiteBackground,
                            size: 30,
                          ),
                          onTap: () =>
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Pressed the search button')),
                              ))
                    ])),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: content(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    final splitted = widget.article.title.split(' ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: widget.article.urlToImage!,
          child: Image.network(widget.article.urlToImage!),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text("${splitted[0]} ${splitted[1]} ${splitted[2]}",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(width: 10),
            Text(" | ", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(width: 10),
            Text("${splitted[3]} ${splitted[4]} ${splitted[5]}",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(width: 10),
            Text(" | ", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: 10),
        Text(widget.article.title,
            style: Theme.of(context).textTheme.displaySmall),
        SizedBox(height: 10),
        Text('${widget.article.author}',
            style: Theme.of(context).textTheme.bodySmall),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 10,
          width: MediaQuery.of(context).size.width,
          color: mediumBlue,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("KEY POINTS",
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(
                "• ${widget.article.description ?? "-"}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: mediumBlue,
              ),
              Divider(color: Colors.grey),
              Divider(color: Colors.grey),
              Text('Date: ${widget.article.publishedAt}',
                  style: Theme.of(context).textTheme.labelSmall),
              Divider(color: Colors.grey),
              Text(widget.article.content ?? "-",
                  style: Theme.of(context).textTheme.labelLarge),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
