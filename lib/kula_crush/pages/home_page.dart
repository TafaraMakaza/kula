
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:kula_game/kula_crush/animations/shine_effect.dart';
import 'package:kula_game/kula_crush/bloc/bloc_provider.dart';
import 'package:kula_game/kula_crush/bloc/game_bloc.dart';
import 'package:kula_game/kula_crush/game_widgets/double_curved_container.dart';
import 'package:kula_game/kula_crush/game_widgets/game_level_button.dart';
import 'package:kula_game/kula_crush/game_widgets/shadowed_text.dart';
import 'package:kula_game/kula_crush/model/level.dart';
import 'package:kula_game/kula_crush/pages/game_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  final deepGreen = Color(0xFF454C48);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )
      ..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.6,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GameBloc gameBloc = BlocProvider.of<GameBloc>(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double levelsWidth = -100.0 + ((mediaQueryData.orientation == Orientation.portrait) ? screenSize.width : screenSize.height);

    return Scaffold(
      backgroundColor: deepGreen,
      body: WillPopScope(
        // No way to get back
        onWillPop: () async => false,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShadowedText(
                  text: 'by Kula',
                  color: Colors.white,
                  fontSize: 15.0,
                  offset: Offset(1.0, 1.0),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: levelsWidth,
                height: levelsWidth,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: gameBloc.numberOfLevels,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GameLevelButton(
                          color: Colors.deepOrange,
                          text: 'Level',
                          level: '${index + 1}',
                          onTap: () async {
                            Level newLevel = await gameBloc.setLevel(index + 1);

                            // Open the Game page
                            Navigator.of(context).push(GamePage.route(newLevel));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ), 
            ),
            Positioned(
              left: 0.0,
              top: _animation.value * 250.0 - 150.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: DoubleCurvedContainer(
                  width: screenSize.width - 60.0,
                  height: 150.0,
                  outerColor: Colors.orange,
                  innerColor: Colors.deepOrange,
                  child: Stack(
                    children: <Widget>[
                      ShineEffect(
                        offset: Offset(100.0, 100.0),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ShadowedText(
                          text: 'KULA SWAP',
                          color: Colors.white,
                          fontSize: 46.0,
                          shadowOpacity: 1.0,
                          offset: Offset(1.0,1.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
