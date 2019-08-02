import 'package:flutter/material.dart' show Color;
import 'package:page_reveal_1/src/models/inApp/page_view_model.dart';

enum SlideDirection {
  leftToRight,
  RightToLeft,
  none,
}

class PageIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final double slidePercent;
  final SlideDirection slideDirection;

  PageIndicatorViewModel(
      this.pages, this.activeIndex, this.slidePercent, this.slideDirection);
}

class PagerBubbleViewModel {
  final String iconAssetPath;
  final bool isHollow;
  final Color color;
  final double activePercent;

  PagerBubbleViewModel(
      this.iconAssetPath, this.isHollow, this.color, this.activePercent);
}
