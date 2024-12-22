import 'package:flabby_game/bloc/game/cubit/game_cubit.dart';
import 'package:flabby_game/main_page.dart';
import 'package:flabby_game/service_locator.dart';
import 'package:flabby_game/widget/audio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(getIt.get<AudioHelper>()),
      child: MaterialApp(
        title: 'Flappy Dash',
        theme: ThemeData(fontFamily: 'Chewy'),
        home: MainPage(),
      ),
    );
  }
}
