import 'package:flutter/material.dart';

class MenuRoundButton extends StatelessWidget {
  final Animation<double> buttonGrowAnimation;
  MenuRoundButton({this.buttonGrowAnimation});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: buttonGrowAnimation.value * 60,
      height: buttonGrowAnimation.value * 60,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
          color: const Color.fromRGBO(247, 64, 106, 1.0),
          shape: BoxShape.circle),
      child: new Icon(
        Icons.menu,
        size: buttonGrowAnimation.value * 40.0,
        color: Colors.white,
      ),
    ));
  }
}