
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:kula_game/utils/my_navigator.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 4000), () => MyNavigator.goToHome(context));
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FlareActor(
              'assets/grass.flr',
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
              animation: "peace"
          ),

          FlareActor(
              'assets/flash.flr',
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
              animation: "intro"
          ),
        ],

      ),
    );
  }


}
