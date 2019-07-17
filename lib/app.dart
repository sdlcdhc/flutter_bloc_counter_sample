
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter_sample/home_page.dart';
import 'package:flutter_counter_sample/second_page.dart';
import 'package:flutter_counter_sample/theme_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (_, themeMode) {
        return MaterialApp(
          home: HomePage(title: "HomePage"),
          routes: {
            "second": (ctx) => SecondPage(title: "SecondPage")
          },
          theme: themeMode == ThemeMode.dark ? ThemeData.dark() : ThemeData.light(),
        );
      },
    );
  }
}