import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_sample/app.dart';
import 'package:flutter_counter_sample/counter_bloc.dart';
import 'package:flutter_counter_sample/theme_bloc.dart';

class SimpleBlockDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('event=$event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("transition=$transition");
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('error=$error');
  }
}

/// 程序的主入口
void main() {
  BlocSupervisor.delegate = SimpleBlockDelegate();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          builder: (ctx) => CounterBloc()
        ),
        BlocProvider<ThemeBloc>(
          builder: (ctx) => ThemeBloc(),
        )
      ],
      child: MyApp(),
    )
  );
}
