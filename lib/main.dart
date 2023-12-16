import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Given Title
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //Given Theme Color
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      //Declared first page of our app
      home: HomePage(),
    );
  }
}
