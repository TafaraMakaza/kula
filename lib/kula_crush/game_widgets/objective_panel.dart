import 'package:flutter/material.dart';
import 'package:kula_game/kula_crush/bloc/bloc_provider.dart';
import 'package:kula_game/kula_crush/bloc/game_bloc.dart';
import 'package:kula_game/kula_crush/game_widgets/stream_objective_item.dart';
import 'package:kula_game/kula_crush/model/level.dart';
import 'package:kula_game/kula_crush/model/objective.dart';

class ObjectivePanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GameBloc gameBloc = BlocProvider.of<GameBloc>(context);
    final Level level = gameBloc.gameController.level ?? 1;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final EdgeInsets paddingTop = EdgeInsets.only(top: (orientation == Orientation.portrait ? 10.0 : 0.0));
    //
    // Build the objectives
    //
    List<Widget> objectiveWidgets = level.objectives.map((Objective obj){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: StreamObjectiveItem(objective: obj),
      );
    }).toList();

    return Padding(
      padding: paddingTop,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300].withOpacity(0.7),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 5.0, color: Colors.black.withOpacity(0.5)),
        ),
        height: 80.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: objectiveWidgets,
        ),
      ),
    );
  }
}