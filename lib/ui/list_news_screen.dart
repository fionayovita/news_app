import 'package:app_news/api/api_service.dart';
import 'package:app_news/common/styles.dart';
import 'package:app_news/model/article.dart';
import 'package:app_news/provider/news_provider.dart';
import 'package:app_news/widgets/card_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_flags_svg/flutter_circle_flags_svg.dart';
import 'package:provider/provider.dart';

class ListNewsArgs {
  final String type;

  const ListNewsArgs({
    required this.type,
  });
}

class ListNewsScreen extends StatefulWidget {
  static const routeName = "list_news_screen";

  final String type;

  const ListNewsScreen({
    required this.type,
  });

  @override
  _ListNewsScreenState createState() => _ListNewsScreenState();
}

class _ListNewsScreenState extends State<ListNewsScreen> {
  late Future<ArticlesResult> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiService(category: widget.type).topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.type}',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 10,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search articles...',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                  ),
                  // onSubmitted: (query) {
                  //   state.checkQuery(query);
                  // },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: buildList(context),
            )
          ],
        ),
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
      create: (_) =>
          NewsProvider(apiService: ApiService(category: widget.type)),
      child: FutureBuilder<ArticlesResult>(
        future: _article,
        builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
          var state = snapshot.connectionState;
          print("lookkk ${snapshot.data?.articles.length}");
          if (state != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              if (snapshot.data?.articles.length != 0) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.articles.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data?.articles[index];
                    return CardArticle(article: article!);
                  },
                );
              } else {
                return Text("There is no news on this category",
                    style: Theme.of(context).textTheme.bodyLarge);
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Material(
                  child: Text(snapshot.error.toString(),
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              );
            } else {
              return Material(
                child: Text(
                  'eror',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
