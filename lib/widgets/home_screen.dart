import 'package:flutter/material.dart';
import 'package:sm_native/app_state_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    final container = AppStateContainer.of(context);

    container.incrementCounter();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final container = AppStateContainer.of(context);
    final counterGlobal = container.state.counter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button (local):',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Container(margin: EdgeInsets.only(top: 20.0)),
            Text(
              'You have pushed the button (global):',
            ),
            Text(
              '$counterGlobal',
              style: Theme.of(context).textTheme.display1,
            ),
            Container(margin: EdgeInsets.only(top: 20.0)),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/another');
              },
              child: Text('Go to another screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
