import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/inApp/pager_indicator.dart';

class PagerIndicator extends StatelessWidget {
  final PageIndicatorViewModel pageIndicatorViewModel;

  const PagerIndicator({Key key, this.pageIndicatorViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PagerBubble> pagerBubbles = [];

    for (int i = 0; i < pageIndicatorViewModel.pages.length; i++) {
      var page = pageIndicatorViewModel.pages[i];
      pagerBubbles.add(
        PagerBubble(
          pagerBubbleViewModel: PagerBubbleViewModel(
            page.iconAssetPath,
            i > pageIndicatorViewModel.activeIndex,
            page.color,
            i == pageIndicatorViewModel.activeIndex ? 1.0 : 0.0,
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pagerBubbles,
        )
      ],
    );
  }
}

class PagerBubble extends StatelessWidget {
  final PagerBubbleViewModel pagerBubbleViewModel;

  const PagerBubble({Key key, this.pagerBubbleViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: lerpDouble(20.0, 45.0, pagerBubbleViewModel.activePercent),
        height: lerpDouble(20.0, 45.0, pagerBubbleViewModel.activePercent),
        child: Opacity(
          opacity: pagerBubbleViewModel.activePercent,
          child: Image.asset(
            pagerBubbleViewModel.iconAssetPath,
            color: pagerBubbleViewModel.color,
          ),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: pagerBubbleViewModel.isHollow
                ? Colors.transparent
                : const Color(0x88FFFFFF),
            border: Border.all(
              color: pagerBubbleViewModel.isHollow
                  ? const Color(0x88FFFFFF)
                  : Colors.transparent,
              width: 3.0,
            )),
      ),
    );
  }
}
