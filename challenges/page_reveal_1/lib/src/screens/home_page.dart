import 'package:flutter/material.dart';
import 'package:page_reveal_1/src/widgets/pager_indicator.dart';
import 'package:page_reveal_1/src/widgets/pages.dart';
import 'package:page_reveal_1/src/widgets/page_reveal.dart';
import 'package:page_reveal_1/src/models/inApp/pager_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Page(
            pageViewModel: pages[0],
            percentVisible: 1.0,
          ),
          Page(
            pageViewModel: pages[1],
            percentVisible: 1.0,
          ),
          PageReveal(
            revealPercent: .4,
            child: Page(
              pageViewModel: pages[2],
              percentVisible: 1.0,
            ),
          ),
          PagerIndicator(
            pageIndicatorViewModel:
                PageIndicatorViewModel(pages, 1, 0.0, SlideDirection.none),
          )
        ],
      ),
    );
  }
}
