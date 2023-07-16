import 'package:app_news/ui/list_news_screen.dart';
import 'package:app_news/ui/main_screen.dart';
import 'package:app_news/ui/news_detail_screen.dart';
import 'package:app_news/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class RouterHelper {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case ListNewsScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          final args = settings.arguments as ListNewsArgs;
          ListNewsArgs argument = args;
          return ListNewsScreen(type: args.type);
        });
      case NewsDetailScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          final args = settings.arguments as NewsDetailArgs;
          NewsDetailArgs argument = args;
          return NewsDetailScreen(article: args.article);
        });

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}',
                    style: TextStyle(color: Colors.black))),
          ),
        );
    }
  }
}
