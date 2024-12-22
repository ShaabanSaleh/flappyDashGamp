import 'package:flabby_game/bloc/game/cubit/game_cubit.dart';
import 'package:flabby_game/component/pipe.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

import 'hidden_coin.dart';

class PipePair extends PositionComponent
    with FlameBlocReader<GameCubit, GameState> {
  PipePair({
    required super.position,
    this.gap = 200.0,
    this.speed = 200.0,
  });

  final double gap;
  final double speed;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    addAll([
      Pipe(
        isFlipped: false,
        position: Vector2(0, gap / 2),
      ),
      Pipe(
        isFlipped: true,
        position: Vector2(0, -(gap / 2)),
      ),
      HiddenCoin(
        position: Vector2(30, 0),
      ),
    ]);
  }

  @override
  void update(double dt) {
    switch (bloc.state.currentPlayingState) {
      // TODO: Handle this case.
      case PlayingState.paused:
      // TODO: Handle this case.
      case PlayingState.gameOver:
      case PlayingState.idle:
        break;
      // TODO: Handle this case.
      case PlayingState.playing:
        // TODO: Handle this case.
        position.x -= speed * dt;
        super.update(dt);
        break;
    }
  }
}
