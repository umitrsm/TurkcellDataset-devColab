import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  DrawPage({Key key}) : super(key: key);
  String path;
  DrawPage.withPage(this.path);

  @override
  _DrawPageState createState() => _DrawPageState.withPath(path);
}

class _DrawPageState extends State<DrawPage> {
  List<Offset> _points = <Offset>[];
  List<List<Offset>> _savedPoints = [];
  void add(List<Offset> points) {
    _savedPoints.add(points);
    print(points);
  }

  String imagePath;
  _DrawPageState.withPath(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                add(_points);
              }),
          IconButton(
              icon: Icon(Icons.backup),
              onPressed: () {
                Navigator.pushNamed(context, 'SavedDraw',
                    arguments: _savedPoints);
              })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        ),
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox object = context.findRenderObject();
              Offset _localPosition =
                  object.globalToLocal(details.globalPosition);
              _points = new List.from(_points)..add(_localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: CustomPaint(
            painter: Signature(points: _points),
            size: Size.infinite,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () => _points.clear(),
      ),
    );
  }
}

class Signature extends CustomPainter {
  List<Offset> points;

  Signature({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 30.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}
