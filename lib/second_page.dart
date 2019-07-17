import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'counter_bloc.dart';

class SecondPage extends StatelessWidget {
  final String title;
  final key1 = GlobalKey();
  final key2 = GlobalKey();

  SecondPage({Key key, this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CounterEvent, int>(
        bloc: counterBloc,
        builder: (_, value) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '当前的计数值为 $value',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: FlatButton(
                        key: key1,
                        child: Icon(Icons.add),
                        onPressed: () {
                          counterBloc.dispatch(CounterEvent.increment);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: FlatButton(
                        key: key2,
                        child: Icon(Icons.remove),
                        onPressed: () {
                          counterBloc.dispatch(CounterEvent.decrement);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
