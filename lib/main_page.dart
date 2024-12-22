import 'dart:ui';

import 'package:flabby_game/bloc/game/cubit/game_cubit.dart';
import 'package:flabby_game/flappy_dash_game.dart';
import 'package:flabby_game/widget/game_over_widget.dart';
import 'package:flabby_game/widget/tap_to_play.dart';
import 'package:flabby_game/widget/top_score.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlappyDashGame _flappyDashGame;

  late GameCubit gameCubit;

  PlayingState? _latestState;

  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    _flappyDashGame = FlappyDashGame(gameCubit: gameCubit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {
        if (state.currentPlayingState.isIdle &&
            _latestState == PlayingState.gameOver) {
          setState(() {
            _flappyDashGame = FlappyDashGame(gameCubit: gameCubit);
          });
        }

        _latestState = state.currentPlayingState;
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              GameWidget(game: _flappyDashGame),
              if (state.currentPlayingState.isGameOver) const GameOverWidget(),
              if (state.currentPlayingState.isIdle)
                Align(alignment: Alignment(0, 0.2), child: TapToPlay()),
              if (state.currentPlayingState.isNotGameOver) TopScore()
            ],
          ),
        );
      },
    );
  }
}
