import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
// import 'dart:async' show Future;
// import 'package:flutter/services.dart' show rootBundle;


class TweenSampleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('Tween Sample'),
        ),
        body: Column(
          children: [
            Text('Tween'),
            AnimeLogo(),
            RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('back'),
            )
          ],
        )
    );
  }
}


class AnimeLogo extends StatefulWidget {
  @override
  _AnimeLogoState createState() => _AnimeLogoState();
}

class _AnimeLogoState extends State<AnimeLogo> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener(_onAnimationStateChanged)
    ;
    controller.forward();
  }

  void _onAnimationStateChanged(AnimationStatus status) {
    switch (status){
      case AnimationStatus.completed:
        controller.reverse();
        break;
      case AnimationStatus.dismissed:
        controller.forward();
        break;
      default:
        break;
    }
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
        animation: animation,
        child: AniLogoWidget()
    );
  }

}

class GrowTransition extends StatelessWidget {

  final Widget child;
  final Animation<double> animation;
  // GrowTransition({Key: key, Animation<double> animation})
  // : super(key: key, listenable: animation);

  GrowTransition({ this.animation, this.child})
      : assert(child != null),
        assert(animation != null)
  ;

  @override
  Widget build(BuildContext context) {
    // final Animation<double> animation = listenable;

    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Container(
          width: animation.value,
          height: animation.value,
          child: child,
        );
      },
    );

  }
}

class AniLogoWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Image(image:AssetImage('./assets/images/150x150.png')),
    );
    // throw UnimplementedError();
  }
}