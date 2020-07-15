import 'package:drawapp/home_page.dart';

import 'package:drawapp/screens/saved_draw.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<List<Offset>> points;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draw Demo',
      home: HomePage(),
      routes: {
        'SavedDraw': (ctx) => SavedDraw(
              points: points,
            ),
      },
    );
  }
}
