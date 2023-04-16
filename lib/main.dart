import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:movieapp/repo/movie_repo.dart';
import 'package:movieapp/styles/my_color.dart';
import 'package:movieapp/styles/my_textstyle.dart';
import 'package:movieapp/ui/home_screen.dart';
import 'package:movieapp/utils/api_util.dart';
import 'package:movieapp/utils/constants.dart';

void main() {
  ApiUtil.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: MyColor.materialCoral,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColor.coral,
              foregroundColor: MyColor.white,
              textStyle: MyTextStyles.buttonStyle,
            ),
          ),
          scaffoldBackgroundColor: MyColor.black,
        ),
        home: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: const HomeScreen(),
        )
        // _DebuggerScreen()
        // HomeScreen(),
        );
  }
}

class _DebuggerScreen extends StatelessWidget {
  const _DebuggerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          MovieRepo().getPopularMovies().then((value) => log(value.toString()));
          ApiUtil.instance
              .get(path: Constants.latestMovieUrl)
              .then((value) => log(value.toString()));
        },
        child: const Text("Watch now"),
      ),
    );
  }
}
