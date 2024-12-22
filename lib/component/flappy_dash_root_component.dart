import 'dart:math';

import 'package:flabby_game/bloc/game/cubit/game_cubit.dart';
import 'package:flabby_game/component/dash.dart';
import 'package:flabby_game/component/dash_parallax_background.dart';
import 'package:flabby_game/component/pipe_pair.dart';
import 'package:flabby_game/flappy_dash_game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';

class FlappyDashRootComponent extends Component
    with HasGameRef<FlappyDashGame>, FlameBlocReader<GameCubit, GameState> {
  late Dash _dash;
  late PipePair _lastPipe;
  static const _pipesDistance = 400.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(DashParallaxBackground());
    add(_dash = Dash());
    _generatePipes(
      fromX: 350,
    );
  }

  void _generatePipes({
    int count = 5,
    double fromX = 0.0,
  }) {
    for (int i = 0; i < count; i++) {
      const area = 600;
      final y = (Random().nextDouble() * area) - (area / 2);
      add(_lastPipe = PipePair(
        position: Vector2(fromX + (i * _pipesDistance), y),
      ));
    }
  }

  void _removeLastPipes() {
    final pipes = children.whereType<PipePair>();
    final shouldBeRemoved = max(pipes.length - 5, 0);
    pipes.take(shouldBeRemoved).forEach((pipe) {
      pipe.removeFromParent();
    });
  }

  @override
  void onTapDown(TapDownEvent event) {
    _checkToStart();
    _dash.jump();
  }

  void onSpaceDown() {
    _checkToStart();
    _dash.jump();
  }

  void _checkToStart() {
    if (bloc.state.currentPlayingState.isIdle) {
      bloc.startPlaying();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    // _scoreText.text = bloc.state.currentScore.toString(); hnst5demha fe el view
    if (_dash.x >= _lastPipe.x) {
      _generatePipes(
        fromX: _pipesDistance,
      );
      _removeLastPipes();
    }
    game.camera.viewfinder.zoom = 1.0;
  }
}
