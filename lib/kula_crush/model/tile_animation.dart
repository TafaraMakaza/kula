

import 'package:kula_game/kula_crush/model/row_col.dart';
import 'package:kula_game/kula_crush/model/tile.dart';

///
/// TileAnimation
///
/// Class which is used to register a Tile animation
class TileAnimation{
  TileAnimation({
    this.animationType,
    this.delay,
    this.from,
    this.to,
    this.tileType,
    this.tile,
  });

  final TileAnimationType animationType;
  final int delay;
  final RowCol from;
  final RowCol to;
  final TileType tileType;
  Tile tile;
}

//
// Types of animations
//
enum TileAnimationType {
  moveDown,
  avalanche,
  newTile,
  chain,
  collapse,
}