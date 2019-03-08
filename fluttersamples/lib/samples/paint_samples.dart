/*
 * @Author: Tan Dong 
 * @Date: 2019-03-08 20:25:20 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-03-08 20:25:20 
 */
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'dart:ui';

class PaintSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaintSamplesState();
  }
}

class PaintSamplesState extends State<PaintSamples>
    with TickerProviderStateMixin {
  double percentage = 0.0;
  double newPercentage = 0.0;
  AnimationController percentageAnimationController;

  @override
  void initState() {
    super.initState();

    setState(() {
      percentage = 0.0;
    });
    percentageAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {
          percentage = lerpDouble(
              percentage, newPercentage, percentageAnimationController.value);
        });
      });
  }

  //Path,Picture,Canvas,Vertices,ImageShader,Gradient,Shader,
//ImageFilter,Shadow,PictureRecorder,Paint,ColorFilter,
//MaskFilter,Image,FrameInfo,CodeC,PathMetric,EngineLayer,
//Color,Tangent,PathMetricIterator,StrokeJoin,PathOperation,
//PixelFormat,ImageByteFormat,Clip,PaintingStyle,
//TileMode,BlurStyle,StrokeCap,VertexMode,FilterQuality,
//PointMode,PathFillType
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paint'),
      ),
      body: progress1(),
    );
  }

  Widget progress1() {
    return Center(
      child: new Container(
        height: 200.0,
        width: 200.0,
        child: new CustomPaint(
          foregroundPainter: new MyPainter(
              lineColor: Colors.lightBlueAccent,
              completeColor: Colors.blueAccent,
              completePercent: percentage,
              width: 8.0),
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new RaisedButton(
                color: Colors.green,
                splashColor: Colors.transparent,
                shape: new CircleBorder(),
                child: new Text("Click"),
                onPressed: () {
                  setState(() {
                    percentage = newPercentage;
                    newPercentage += 10;
                    if (newPercentage > 100.0) {
                      percentage = 0.0;
                      newPercentage = 0.0;
                    }
                    percentageAnimationController.forward(from: 0.0);
                  });
                }),
          ),
        ),
      ),
    );
  }

  Widget paint1() {
    return CustomPaint(
      painter: Sky(),
      child: Center(
        child: Text(
          'Once upon a time...',
          style: const TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w900,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}

class Sky2 extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    PictureRecorder pictureRecorder = PictureRecorder();
    canvas = Canvas(pictureRecorder);
    Offset center = Offset(size.width / 2, size.height / 2); //  坐标中心
    double radius = min(size.width / 2, size.height / 2); //  半径
    Paint paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate == this;
  }
}

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradient = RadialGradient(
      center: const Alignment(0.7, -0.6),
      radius: 0.2,
      colors: [const Color(0xFFFFFF00), const Color(0xFF0099FF)],
      stops: [0.4, 1.0],
    );
    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) {
      // Annotate a rectangle containing the picture of the sun
      // with the label "Sun". When text to speech feature is enabled on the
      // device, a user will be able to locate the sun on this picture by
      // touch.
      var rect = Offset.zero & size;
      var width = size.shortestSide * 0.4;
      rect = const Alignment(0.8, -0.9).inscribe(Size(width, width), rect);
      return [
        CustomPainterSemantics(
          rect: rect,
          properties: SemanticsProperties(
            label: 'Sun',
            textDirection: TextDirection.ltr,
          ),
        ),
      ];
    };
  }

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2); //  坐标中心
    double radius = min(size.width / 2, size.height / 2); //  半径
    canvas.drawCircle(
        //  画圆方法
        center,
        radius,
        line);

    double arcAngle = 2 * pi * (completePercent / 100);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2, //  从正上方开始
        arcAngle,
        false,
        complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
