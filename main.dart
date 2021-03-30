import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    Paint _paint = Paint()
      ..color = Colors.pink //画笔颜色
      ..strokeCap = StrokeCap.round //画笔笔触类型
      ..isAntiAlias = true //是否启动抗锯齿
      ..blendMode = BlendMode.exclusion //颜色混合模式
      ..style = PaintingStyle.fill //绘画风格，默认为填充
      ..colorFilter = ColorFilter.mode(Colors.blueAccent,
          BlendMode.exclusion) //颜色渲染模式，一般是矩阵效果来改变的,但是flutter中只能使用颜色混合模式
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果，flutter中只有这个
      ..filterQuality = FilterQuality.high //颜色渲染模式的质量
      ..strokeWidth = 15.0;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              height: 100,
              color: Colors.red,
              child: CustomPaint(
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
              )

            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class Sky extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.red //画笔颜色
    ..strokeCap = StrokeCap.butt //画笔笔触类型
    // ..isAntiAlias = true //是否启动抗锯齿
    // ..blendMode = BlendMode.exclusion //颜色混合模式
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    // ..colorFilter = ColorFilter.mode(Colors.redAccent,
    //     BlendMode.exclusion) //颜色渲染模式，一般是矩阵效果来改变的,但是flutter中只能使用颜色混合模式
    // ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果，flutter中只有这个
    ..filterQuality = FilterQuality.high //颜色渲染模式的质量
    ..strokeWidth = 1.0; //



  @override
  void paint(Canvas canvas, Size size) {

    // Path path = new Path();
    // path.moveTo(0, 0);
    // path.lineTo(100, 100);
    // path.lineTo(200, 200);
    // path.lineTo(0, 0);
    // path.close();
    // canvas.drawPath(path, _paint);
    // canvas.drawCircle(Offset(100, 100), 50, _paint);
    canvas.drawLine(Offset(20.0, 20.0), Offset(100.0, 100.0), _paint);
    const PI = 3.1415926;
    // Rect rect2 = Rect.fromCircle(center: Offset(100.0, 50.0), radius: 200.0);
    // canvas.drawArc(rect2, -PI, PI, false, _paint,);

    // Rect rect1 = Rect.fromPoints(Offset(150.0, 200.0), Offset(300.0, 250.0));
    // canvas.drawOval(rect1, _paint);

    var startPoint = Offset(0, size.height);
    var controlPoint1 = Offset(size.width / 4, size.height / 3 * 4);
    var controlPoint2 = Offset(3 * size.width / 4, size.height / 3 * 4);
    var endPoint = Offset(size.width, size.height);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint2.dx, controlPoint2.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, _paint);

    //用Rect构建一个边长50,中心点坐标为100,100的矩形
    Rect rect = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 50.0);
    //根据上面的矩形,构建一个圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(20.0));
    canvas.drawRRect(rrect, _paint);

    // var rect = Offset.zero & size;
    // var gradient = RadialGradient(
    //   center: const Alignment(0.7, -0.6),
    //   radius: 0.2,
    //   colors: [const Color(0xFFFFFF00), const Color(0xFF0099FF)],
    //   stops: [0.4, 1.0],
    // );
    // canvas.drawPath(
    //     path,
    //     _paint
    // );
  }

  // @override
  // SemanticsBuilderCallback get semanticsBuilder {
  //   return (Size size) {
  //     // Annotate a rectangle containing the picture of the sun
  //     // with the label "Sun". When text to speech feature is enabled on the
  //     // device, a user will be able to locate the sun on this picture by
  //     // touch.
  //     var rect = Offset.zero & size;
  //     var width = size.shortestSide * 0.4;
  //     rect = const Alignment(0.8, -0.9).inscribe(Size(width, width), rect);
  //     return [
  //       CustomPainterSemantics(
  //         rect: rect,
  //         properties: SemanticsProperties(
  //           label: 'Sun',
  //           textDirection: TextDirection.ltr,
  //         ),
  //       ),
  //     ];
  //   };
  // }

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
