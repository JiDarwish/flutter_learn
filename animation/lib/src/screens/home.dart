import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  Animation<double> boxAnimation;
  AnimationController boxController;

  // Lifecycle method automatically called anytime new home state is created
  @override
  void initState() {
    super.initState();

    
    boxController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 80),
    );

    boxAnimation = Tween(begin: pi * .6, end: pi * .63)
    .animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.easeInOut,
      )
    )

    catController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    catAnimation = Tween(begin: -50.0, end: -80.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );

    boxController.addStatusListener(boxStatusListener);
    boxController.forward();
  }

  void boxStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      boxController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      boxController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
 
  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
      boxController.forward();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
      boxController.stop();
    }
  }

  Widget buildCatAnimation() => AnimatedBuilder(
        animation: catAnimation,
        builder: (context, child) {
          return Positioned(
            child: child,
            top: catAnimation.value,
            right: 0.0,
            left: 0.0,
          );
        },
        child: Cat(),
      );

  Widget buildBox() => Container(
        height: 200.0,
        width: 200.0,
        color: Colors.brown,
      );

  Widget buildLeftFlap() => Positioned(
    left: 3.0,
    child: AnimatedBuilder(
      animation: boxAnimation,
      child: Container(
        height: 10.0,
        width: 125.0,
        color: Colors.brown,
      ),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          child: child,
          alignment: Alignment.topLeft,
          angle: boxAnimation.value,
        );
      },
    ),
  );

   Widget buildRightFlap() => Positioned(
    right: 3.0,
    child: AnimatedBuilder(
      animation: boxAnimation,
      child: Container(
        height: 10.0,
        width: 125.0,
        color: Colors.brown,
      ),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          child: child,
          alignment: Alignment.topRight,
          angle: -boxAnimation.value,
        );
      },
    ),
  );

 
}
