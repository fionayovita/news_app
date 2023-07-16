import 'package:app_news/common/styles.dart';
import 'package:app_news/model/article.dart';
import 'package:app_news/ui/news_detail_screen.dart';
import 'package:flutter/material.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: whiteBackground, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        title: Text(article.title,
            style: Theme.of(context).textTheme.headlineSmall),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              article.author ?? "-",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              article.publishedAt!.toIso8601String(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        onTap: () => Navigator.pushNamed(context, NewsDetailScreen.routeName,
            arguments: NewsDetailArgs(
              article: article,
            )),
      ),
    );
  }
}
