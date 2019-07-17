
import 'package:bloc/bloc.dart';

enum ThemeEvent {
  light, /// 白天模式
  dark /// 暗黑模式
}

enum ThemeMode {
  light,
  dark
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  @override
  ThemeMode get initialState => ThemeMode.light;

  @override
  Stream<ThemeMode> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.light:
        yield ThemeMode.light;
        break;
      case ThemeEvent.dark:
        yield ThemeMode.dark;
        break;
    }
  }
  
}