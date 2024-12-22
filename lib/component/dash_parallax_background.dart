import 'package:flabby_game/bloc/game/cubit/game_cubit.dart';
import 'package:flabby_game/flappy_dash_game.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame_bloc/flame_bloc.dart';

class DashParallaxBackground extends ParallaxComponent<FlappyDashGame>
    with FlameBlocReader<GameCubit, GameState> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    anchor = Anchor.center;
    parallax = await game.loadParallax(
      [
        ParallaxImageData('background/layer1-sky.png'),
        ParallaxImageData('background/layer2-clouds.png'),
        ParallaxImageData('background/layer3-clouds.png'),
        ParallaxImageData('background/layer4-clouds.png'),
        ParallaxImageData('background/layer5-huge-clouds.png'),
        ParallaxImageData('background/layer6-bushes.png'),
        ParallaxImageData('background/layer7-bushes.png'),
      ],
      baseVelocity: Vector2(1, 0),
      velocityMultiplierDelta: Vector2(1.7, 0),
    );
  }

  @override
  void update(double dt) {
    switch (bloc.state.currentPlayingState) {
      case PlayingState.idle:
      // TODO: Handle this case.
      case PlayingState.playing:
        super.update(dt);
        break;
      case PlayingState.paused:
      // TODO: Handle this case.
      case PlayingState.gameOver:
        // TODO: Handle this case.
        break;
    }
  }
}
