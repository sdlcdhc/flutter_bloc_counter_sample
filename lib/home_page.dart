import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter_sample/counter_bloc.dart';
import 'package:flutter_counter_sample/theme_bloc.dart';

/// 首页
class HomePage extends StatelessWidget {
  final String title;
  final floatingActionButtonKey = new GlobalKey(debugLabel: "HomePageFloatingButton");

  HomePage({Key key, this.title}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    final themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
          appBar: AppBar(
            title: Text(title)
          ),
          body: BlocBuilder<CounterEvent, int>(
            bloc: counterBloc,
            builder: (BuildContext context, int count) {
              return Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    BlocBuilder<ThemeEvent, ThemeMode>(
                      bloc: themeBloc,
                      builder: (_, themeMode) {
                        return RaisedButton(
                          child: Text('切换主题'),
                          onPressed: () {
                            if (themeMode == ThemeMode.light) {
                              themeBloc.dispatch(ThemeEvent.dark);
                            } else {
                              themeBloc.dispatch(ThemeEvent.light);
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: 150),
                    Text(
                      '当前的计数值为$count',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                )
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            key: floatingActionButtonKey,
            child: Icon(Icons.arrow_forward_ios),
            onPressed: () => Navigator.of(context).pushNamed('second'),
          )
        );
  }
}