import 'package:flutter/material.dart';
import 'theming_and_state_management/main_theming_and_state_management.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean more GetX',
      home: MainThemingAndStateManagementApp(),
    );
  }
}

