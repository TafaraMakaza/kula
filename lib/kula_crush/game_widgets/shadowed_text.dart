import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// ShadowedText
/// 
/// Simple widget that displays a text with its shadow
///
class ShadowedText extends StatelessWidget {
  ShadowedText({
    Key key,
    @required this.text,
    this.fontSize: 16.0,
    this.color: Colors.white,
    this.offset: const Offset(1.0, 1.0),
    this.shadowOpacity: 1.0,
  }) : super(key: key);

  final String text;
  final Color color;
  final Offset offset;
  final double shadowOpacity;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Transform.translate(
          offset: offset,
          child: Text(
            text,
            style: GoogleFonts.gochiHand(textStyle: TextStyle(fontSize: fontSize, color: Colors.black.withOpacity(shadowOpacity))


            ),
          )),
      Text(
        text,
        style: GoogleFonts.gochiHand( textStyle: TextStyle(fontSize: fontSize, color: color, fontFamily: "Whale")),
      ),
    ]);
  }
}
