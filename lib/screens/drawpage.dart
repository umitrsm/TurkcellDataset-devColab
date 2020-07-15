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
    print(_savedPoints[0]);
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
              _localPosition = _localPosition.translate(
                  0.0, -(AppBar().preferredSize.height + 25));

              _points = new List.from(_points)..add(_localPosition);
              print(_localPosition);
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
  List<Offset> points, pointsKeyAlt, pointsKeyUst;

  Signature({this.points});
  bool isValid(Offset ofset, Offset ofset2) {
    List<Offset> _pointskey = <Offset>[
      Offset(266.3, 141.8),
      Offset(266.3, 143.4),
      Offset(266.3, 144.5),
      Offset(266.3, 145.7),
      Offset(266.3, 147.2),
      Offset(266.3, 148.3),
      Offset(267.4, 151.0),
      Offset(267.4, 152.1),
      Offset(267.4, 153.6),
      Offset(268.9, 154.8),
      Offset(268.9, 157.5),
      Offset(268.9, 158.6),
      Offset(268.9, 160.1),
      Offset(268.9, 161.3),
      Offset(268.9, 163.9),
      Offset(268.9, 165.1),
      Offset(268.9, 166.6),
      Offset(268.9, 167.8),
      Offset(268.9, 169.3),
      Offset(266.3, 201.7),
      Offset(267.4, 202.8),
      Offset(267.4, 203.9),
      Offset(268.9, 205.5),
      Offset(270.1, 206.6),
      Offset(270.1, 207.8),
      Offset(271.6, 207.8),
      Offset(271.6, 209.3),
      Offset(271.6, 210.4),
      Offset(271.6, 211.9),
      Offset(272.7, 213.1),
      Offset(272.7, 214.2),
      Offset(272.7, 215.7),
      Offset(272.7, 216.9),
      Offset(272.7, 218.4),
      Offset(273.9, 219.6),
      Offset(273.9, 220.7),
      Offset(273.9, 222.2),
      Offset(275.4, 223.4),
      Offset(275.4, 224.9),
      Offset(275.4, 226.0),
      Offset(275.4, 227.2),
      Offset(275.4, 228.7),
      Offset(275.4, 229.8),
      Offset(275.4, 231.4),
      Offset(275.4, 232.5),
      Offset(275.4, 233.6),
      Offset(275.4, 235.2),
      Offset(275.4, 236.3),
      Offset(275.4, 237.8),
      Offset(275.4, 239.0),
      Offset(275.4, 240.1),
      Offset(275.4, 241.7),
      Offset(275.4, 242.8),
      Offset(276.6, 244.3),
      Offset(276.6, 245.5),
      Offset(280.4, 276.7),
      Offset(280.4, 277.8),
      Offset(280.4, 279.0),
      Offset(281.9, 280.5),
      Offset(281.9, 281.6),
      Offset(283.0, 283.2),
      Offset(283.0, 284.3),
      Offset(283.0, 285.5),
      Offset(283.0, 287.0),
      Offset(283.0, 288.1),
      Offset(283.0, 289.6),
      Offset(283.0, 290.8),
      Offset(283.0, 291.9),
      Offset(283.0, 293.5),
      Offset(283.0, 294.6),
      Offset(283.0, 296.1),
      Offset(283.0, 297.3),
      Offset(283.0, 298.4),
      Offset(284.6, 298.4),
      Offset(284.6, 299.9),
      Offset(284.6, 301.1),
      Offset(284.6, 302.2),
      Offset(284.6, 303.7),
      Offset(284.6, 304.9),
      Offset(284.6, 306.4),
      Offset(284.6, 307.5),
      Offset(284.6, 308.7),
      Offset(284.6, 310.2),
      Offset(284.6, 311.4),
      Offset(285.7, 311.4),
      Offset(285.7, 312.9),
      Offset(285.7, 314.0),
      Offset(285.7, 315.2),
      Offset(285.7, 316.7),
      Offset(286.8, 317.8),
      Offset(286.8, 319.4),
      Offset(288.4, 320.5),
      Offset(288.4, 321.6),
      Offset(288.4, 323.2),
      Offset(288.4, 324.3),
      Offset(289.5, 324.3),
      Offset(289.5, 325.8),
      Offset(291.0, 327.0),
      Offset(291.0, 328.1),
      Offset(291.0, 329.6),
      Offset(292.2, 329.6),
      Offset(291.0, 345.3),
      Offset(291.0, 346.4),
      Offset(291.0, 347.5),
      Offset(291.0, 349.1),
      Offset(291.0, 350.2),
      Offset(291.0, 351.7),
      Offset(291.0, 352.9),
      Offset(291.0, 354.0),
      Offset(291.0, 355.5),
      Offset(291.0, 356.7),
      Offset(291.0, 358.2),
      Offset(291.0, 359.4),
      Offset(291.0, 360.5),
      Offset(291.0, 362.0),
      Offset(291.0, 363.2),
      Offset(291.0, 364.7),
      Offset(291.0, 365.8),
      Offset(291.0, 367.0),
      Offset(291.0, 368.5),
      Offset(291.0, 369.6),
      Offset(291.0, 371.2),
      Offset(291.0, 372.3),
      Offset(291.0, 373.4),
      Offset(291.0, 375.0),
      Offset(291.0, 376.1),
      Offset(291.0, 377.6),
      Offset(289.5, 378.8),
      Offset(289.5, 379.9),
      Offset(289.5, 381.5),
      Offset(288.4, 382.6),
      Offset(286.8, 384.1),
      Offset(286.8, 385.3),
      Offset(285.7, 385.3),
      Offset(284.6, 386.4),
      Offset(283.0, 387.9),
      Offset(283.0, 389.1),
      Offset(281.9, 390.2),
      Offset(281.9, 391.7),
      Offset(280.4, 391.7),
      Offset(279.2, 392.9),
      Offset(275.4, 394.4),
      Offset(273.9, 395.5),
      Offset(272.7, 395.5),
      Offset(272.7, 396.7),
      Offset(271.6, 396.7),
      Offset(270.1, 396.7),
      Offset(239.2, 399.4),
      Offset(235.0, 398.2),
      Offset(233.9, 398.2),
      Offset(232.7, 398.2),
      Offset(231.2, 398.2),
      Offset(230.1, 398.2),
      Offset(228.6, 398.2),
      Offset(227.4, 398.2),
      Offset(226.3, 398.2),
      Offset(224.7, 398.2),
      Offset(222.1, 398.2),
      Offset(220.9, 398.2),
      Offset(218.3, 396.7),
      Offset(217.1, 396.7),
      Offset(215.6, 396.7),
      Offset(214.5, 396.7),
      Offset(213.3, 395.5),
      Offset(210.6, 395.5),
      Offset(209.1, 395.5),
      Offset(208.0, 395.5),
      Offset(206.8, 394.4),
      Offset(205.3, 394.4),
      Offset(204.2, 394.4),
      Offset(202.7, 394.4),
      Offset(201.5, 394.4),
      Offset(200.4, 394.4),
      Offset(198.8, 394.4),
      Offset(198.8, 392.9),
      Offset(197.7, 392.9),
      Offset(196.2, 392.9),
      Offset(195.0, 392.9),
      Offset(193.9, 392.9),
      Offset(193.9, 391.7),
      Offset(192.4, 391.7),
      Offset(191.2, 391.7),
      Offset(188.6, 391.7),
      Offset(185.9, 391.7),
      Offset(184.7, 391.7),
      Offset(183.2, 391.7),
      Offset(182.1, 391.7),
      Offset(180.9, 391.7),
      Offset(179.4, 391.7),
      Offset(178.3, 391.7),
      Offset(176.7, 391.7),
      Offset(175.6, 391.7),
      Offset(172.9, 391.7),
      Offset(149.7, 396.7),
      Offset(148.6, 396.7),
      Offset(147.0, 395.5),
      Offset(145.9, 395.5),
      Offset(144.4, 395.5),
      Offset(143.2, 394.4),
      Offset(142.1, 394.4),
      Offset(140.6, 392.9),
      Offset(139.4, 392.9),
      Offset(137.9, 392.9),
      Offset(136.7, 391.7),
      Offset(135.6, 391.7),
      Offset(134.1, 391.7),
      Offset(132.9, 391.7),
      Offset(131.4, 391.7),
      Offset(130.3, 391.7),
      Offset(129.1, 391.7),
      Offset(127.6, 391.7),
      Offset(126.5, 391.7),
      Offset(124.9, 390.2),
      Offset(123.8, 390.2),
      Offset(122.7, 390.2),
      Offset(121.1, 389.1),
      Offset(120.0, 389.1),
      Offset(118.5, 389.1),
      Offset(116.2, 387.9),
      Offset(114.7, 386.4),
      Offset(113.5, 386.4),
      Offset(110.8, 385.3),
      Offset(110.8, 384.1),
      Offset(109.7, 384.1),
      Offset(108.2, 384.1),
    ];

    bool valid = false;
    Offset ofsetalt, ofsetust;
    //if (ofset != null) {
    // ofset = ofset2;
    ofsetalt = ofset.translate(-30.0, -30.0);
    ofsetust = ofset.translate(30.0, 30.0);
    for (var i = 0; i < _pointskey.length; i++) {
      if (_pointskey[i] != null) {
        if (ofsetalt < _pointskey[i] && _pointskey[i] < ofsetust) valid = true;
      }
      //   }
    }

    return valid;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.amber
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      bool valid = isValid(points[i], points[i + 2]);
      //bool valid = true;
      if (points[i] != null && points[i + 1] != null && valid) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}
