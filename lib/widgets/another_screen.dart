import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sm_native/app_state_container.dart';

class AnotherScreen extends StatefulWidget {
  AnotherScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnotherScreenState createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  Dio client = new Dio();

  int _counter = 0;
  bool _loading = false;

  void _incrementCounter() {
    final container = AppStateContainer.of(context);

    container.incrementCounter();
  }

  load() async {
    setState(() {
      _loading = true;
    });
    Response response = await client.get(
        'https://www.random.org/integers/?num=1&min=1&max=100&col=1&base=10&format=plain&rnd=new');
    setState(() {
      _loading = false;
      _counter = int.parse(response.data);
    });
  }

  @override
  initState() {
    super.initState();
    load();
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
              'Loaded from the server:',
            ),
            _loading
                ? CircularProgressIndicator()
                : Text(
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
