import 'package:flutter/material.dart';

import 'package:login_page/slpash1.dart';

const saveKeyValue = 'UserLoggedIn';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScreenSplash1(),
    );
  }
}
