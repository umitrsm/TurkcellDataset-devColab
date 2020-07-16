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
  List<bool> keyPoints = [];
  List<Offset> points1 = <Offset>[
    Offset(263.6, 148.3),
    Offset(263.6, 179.6),
    Offset(263.6, 203.9),
    Offset(272.7, 227.2),
    Offset(275.4, 248.1),
    Offset(281.9, 267.5),
    Offset(284.6, 290.8),
    Offset(286.8, 306.4),
    Offset(289.5, 325.8),
    Offset(292.2, 338.8),
    Offset(294.8, 352.9),
    Offset(293.3, 367.0),
    Offset(291.0, 378.8),
    Offset(270.1, 386.4),
    Offset(249.5, 389.1),
    Offset(231.2, 392.9),
    Offset(189.7, 394.4),
    Offset(169.1, 394.4),
    Offset(153.5, 396.7),
    Offset(134.1, 395.5),
    Offset(116.2, 392.9),
    Offset(189.7, 214.2),
    Offset(175.6, 227.2),
    Offset(163.8, 242.8),
    Offset(168.0, 257.3),
    Offset(183.2, 267.5),
    Offset(201.5, 271.4),
    Offset(198.8, 290.8),
    Offset(197.7, 291.9),
    Offset(176.7, 303.7),
    Offset(150.8, 303.7),
    Offset(148.6, 302.2),
  ];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < points1.length; i++) {
      keyPoints.add(false);
    }
  }

/*
  void add(List<Offset> points) {
    _savedPoints.add(points);
    print(_savedPoints[0]);
  }
*/
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
                // add(_points);
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
              _localPosition = _localPosition.translate(
                  0.0, -(AppBar().preferredSize.height + 25));

              _points = new List.from(_points)..add(_localPosition);

              print(_localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: CustomPaint(
            painter: Signature(points: _points, dots: points1, keys: keyPoints),
            size: Size.infinite,
            child: CustomPaint(
              painter: DotDrawer(points1, keyPoints),
              size: Size.infinite,
            ),
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

class DotDrawer extends CustomPainter {
  List<Offset> points1;
  List<bool> keys;
  DotDrawer(this.points1, this.keys);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    int i = 0;
    for (i = 0; i < points1.length; i++) {
      if (keys[i] == true) {
        canvas.drawCircle(points1[i], 0, paint);
      } else if (keys[i] == false) {
        canvas.drawCircle(points1[i], 25, paint);
        if (i + 1 < keys.length) {
          canvas.drawCircle(points1[i + 1], 15, paint);
        }
        if (i + 2 < keys.length) {
          canvas.drawCircle(points1[i + 2], 10, paint);
        }
        if (i + 3 < keys.length) {
          canvas.drawCircle(points1[i + 3], 5, paint);
          i = points1.length;
        }
      }
    }
  }

  @override
  bool shouldRepaint(DotDrawer oldDelegate) => oldDelegate.keys != keys;
}

class Signature extends CustomPainter {
  List<Offset> points, pointsKeyAlt, pointsKeyUst, dots, validPoints;
  List<bool> keys;
  Signature({this.points, this.dots, this.keys});

  bool isValid(Offset ofset, Offset ofset2) {
    bool valid = false;
    Offset ofsetalt, ofsetust;
    if (ofset != null) {
      ofset2 = ofset;
      ofsetalt = ofset.translate(-10.0, -10.0);
      ofsetust = ofset.translate(10.0, 10.0);

      for (int i = 0; i < dots.length; i++) {
        if (keys[i] == true) {
        } else if (dots[i] != null) {
          if (ofsetalt < dots[i] && dots[i] < ofsetust) {
            valid = true;
            keys[i] = true;
            return true;
          }
        }
      }
      return valid;
    }
    return valid;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.amber
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20.0;

    for (int i = 0; i < points.length - 1; i++) {
      bool valid = isValid(points[i], points[i + 1]);
      print(valid);
      // valid = true;
      if (points[i] != null && points[i + 1] != null && valid) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}
