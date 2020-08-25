import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kula_game/kula_crush/game_widgets/fancy_button.dart';

class GameLevelButton extends StatelessWidget {
  GameLevelButton({
    Key key,
    this.text: '',
    this.level: '',
    this.size: 25.0,
    this.color: Colors.white,
    @required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final double size;
  final String level;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return FancyButton(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.gochiHand( textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
              ),

              Text(
                level,
                textAlign: TextAlign.center,
                style: GoogleFonts.gochiHand( textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )),
              )

            ],
          ),

        ),
        size: 15,
        color: color,
      onPressed: onTap,
    );
  }
}
