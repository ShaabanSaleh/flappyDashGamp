// import 'package:flutter_soloud/flutter_soloud.dart';

// class AudioHelper {
//   late SoLoud _soLoud;
//   late AudioSource _backGroundSource;
//   late AudioSource _scoreSource;
//   late SoundHandle? _playingBackground;
//   late SoundHandle? _playingScore;

//   Future<void> intialize() async {
//     _soLoud = SoLoud.instance;
//     if (_soLoud.isInitialized) {
//       return;
//     }
//     await _soLoud.init();
//     _backGroundSource = await _soLoud.loadAsset('assets/audio/background.mp3');
//     //  SoundHandle backGroundSoundHandle = await  _soLoud.play(backGroundSource); eltareka el sa7 3lshan aload el audio
//     _scoreSource = await _soLoud.loadAsset('assets/audio/score.mp3');
//   }

//   void playBackgroundAudio() async {
//     _playingBackground = await _soLoud.play(_backGroundSource);
//     _soLoud.setProtectVoice(
//         _playingBackground!, true); // for protect audio from kill
//   }

//   void stopBackgroundAudio() {
//     if (_playingBackground == null) {
//       return;
//     }
//     _soLoud.fadeVolume(_playingBackground!, 0.0, Duration(milliseconds: 500));
//   }

//   void playScoreCollectSound() async {
//     await _soLoud.play(_scoreSource);
//   }

//   void stopScoreCollectSound() {
//     if (_playingScore == null) {
//       return;
//     }
//     _soLoud.fadeVolume(_playingScore!, 0.0, Duration(milliseconds: 500));
//   }
// }

import 'package:flutter_soloud/flutter_soloud.dart';

class AudioHelper {
  late SoLoud _soLoud;
  late AudioSource _backgroundSource;
  SoundHandle? _playingBackground;

  late AudioSource _scoreSource;

  Future<void> initialize() async {
    _soLoud = SoLoud.instance;
    if (_soLoud.isInitialized) {
      return;
    }
    await _soLoud.init();
    _backgroundSource = await _soLoud.loadAsset('assets/audio/background.mp3');
    _scoreSource = await _soLoud.loadAsset('assets/audio/score.mp3');
  }

  void playBackgroundAudio() async {
    _playingBackground = await _soLoud.play(_backgroundSource);
    _soLoud.setProtectVoice(_playingBackground!, true);
  }

  void stopBackgroundAudio() {
    if (_playingBackground == null) {
      return;
    }

    _soLoud.fadeVolume(
      _playingBackground!,
      0.0,
      const Duration(milliseconds: 500),
    );
  }

  void playScoreCollectSound() async {
    await _soLoud.play(_scoreSource);
  }
}
