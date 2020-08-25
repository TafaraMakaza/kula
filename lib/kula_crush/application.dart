
import 'package:flutter/material.dart';
import 'package:kula_game/kula_crush/bloc/bloc_provider.dart';
import 'package:kula_game/kula_crush/bloc/game_bloc.dart';
import 'package:kula_game/kula_crush/pages/home_page.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      bloc: GameBloc(),
      child: MaterialApp(
        title: 'Kula Swap',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: HomePage(),
      ),
    );
  }
}
