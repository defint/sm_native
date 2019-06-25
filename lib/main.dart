import 'package:flutter/material.dart';
import 'package:sm_native/app_state_container.dart';

import 'widgets/another_screen.dart';
import 'widgets/home_screen.dart';

void main() => runApp(AppStateContainer(child: SmNativeApp()));

class SmNativeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM Native',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange,
          accentColor: Colors.orangeAccent,
          buttonColor: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(title: 'Local + Global'),
        '/another': (context) => AnotherScreen(title: 'Local + Async'),
      },
    );
  }
}
