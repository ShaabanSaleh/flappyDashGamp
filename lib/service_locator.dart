import 'package:flabby_game/widget/audio_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<AudioHelper>(() => AudioHelper());
}
