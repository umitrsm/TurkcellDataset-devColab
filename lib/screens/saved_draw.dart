import 'package:drawapp/screens/drawpage.dart';
import 'package:flutter/material.dart';

class SavedDraw extends StatefulWidget {
  List<List<Offset>> points;
  SavedDraw({this.points});

  @override
  _SavedDrawState createState() => _SavedDrawState();
}

class _SavedDrawState extends State<SavedDraw> {
  @override
  Widget build(BuildContext context) {
    final List<List<Offset>> _points = widget.points;
    return Scaffold(
      body: _points == null
          ? Container()
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _points.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: CustomPaint(
                    painter: Signature(points: _points[index]),
                    size: Size.infinite,
                  ),
                );
              }),
    );
  }
}
