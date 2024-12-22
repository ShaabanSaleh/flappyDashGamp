part of 'game_cubit.dart';

class GameState extends Equatable {
  const GameState(
      {this.currentScore = 0, this.currentPlayingState = PlayingState.idle});

  final int currentScore;
  final PlayingState currentPlayingState;

  GameState copyWith({
    int? currentScore,
    PlayingState? currentPlayingState,
  }) =>
      GameState(
          currentPlayingState: currentPlayingState ?? this.currentPlayingState,
          currentScore: currentScore ?? this.currentScore);

  @override
  List<Object> get props => [currentScore, currentPlayingState];
}

enum PlayingState {
  idle,
  playing,
  paused,
  gameOver;

  bool get isPlaying => this == PlayingState.playing;
  bool get isGameOver => this == PlayingState.gameOver;
  bool get isNotGameOver => this != PlayingState.gameOver;

  bool get isIdle => this == PlayingState.idle;

  bool get isPaused => this == PlayingState.paused;
}
