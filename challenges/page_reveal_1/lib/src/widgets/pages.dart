import 'package:flutter/material.dart';
import '../models/inApp/page_view_model.dart';

class Page extends StatelessWidget {
  final PageViewModel pageViewModel;
  final double percentVisible;

  const Page({Key key, this.pageViewModel, this.percentVisible = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: pageViewModel.color,
      child: Opacity(
        opacity: percentVisible,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 50.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Image.asset(
                  pageViewModel.heroAssetPath,
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  pageViewModel.title,
                  style: TextStyle(
                    fontFamily: 'FlamantRoma',
                    color: Colors.white,
                    fontSize: 34.0,
                  ),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 75.0),
                child: Text(
                  pageViewModel.body,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final pages = [
  new PageViewModel(
      const Color(0xFF678FB4),
      'assets/hotels.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'assets/key.png'),
  new PageViewModel(
      const Color(0xFF65B0B4),
      'assets/banks.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'assets/wallet.png'),
  new PageViewModel(
    const Color(0xFF9B90BC),
    'assets/stores.png',
    'Store',
    'All local stores are categorized for your convenience',
    'assets/shopping_cart.png',
  ),
];
