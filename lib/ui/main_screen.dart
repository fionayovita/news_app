import 'package:app_news/common/styles.dart';
import 'package:app_news/ui/list_news_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_flags_svg/flutter_circle_flags_svg.dart';

class MainScreen extends StatelessWidget {
  static const routeName = "main_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News Category',
            style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: mediumBlue,
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
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerIcon(context, "Business"),
                  ContainerIcon(context, "Entertainment"),
                  ContainerIcon(context, "General")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerIcon(context, "Health"),
                  ContainerIcon(context, "Science"),
                  ContainerIcon(context, "Sport")
                ],
              ),
              ContainerIcon(context, "Technology"),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContainerIcon(BuildContext context, String type) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ListNewsScreen.routeName,
          arguments: ListNewsArgs(
            type: type,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: mediumBlue,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Icon(
              Icons.newspaper,
              size: 60,
              color: whiteBackground,
            ),
          ),
          Text('$type', style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
