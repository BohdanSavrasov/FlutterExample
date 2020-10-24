import 'package:flutter/cupertino.dart';
import 'package:random_color/palettes.dart';

class ColorPage extends StatelessWidget {
  final Palette palette;
  final double textOpacity;

  const ColorPage({Key key, this.palette, this.textOpacity}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: palette.gradientColors,
          )
      ),
      child: Center(
          child: Text(
            "Hey there",
            style: TextStyle(
                fontFamily: ".SF UI Text",
                color: palette.textColor.withOpacity(textOpacity),
                fontSize: 27.0,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w200
            ),
          )
      ),
    );
  }
}