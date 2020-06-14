import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

RandomColor _randomColor = RandomColor();
Color _color;

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        lowerBound: 1,
        upperBound: 40)
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(
                color: Colors.blue,
                height: 10,
                thickness: 2.5,
              ),
              AnimateOffer(size: _controller),
              Divider(
                color: Colors.blue,
                height: 10,
                thickness: 2.5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimateOffer extends AnimatedWidget {
  const AnimateOffer({size}) : super(listenable: size);

  Animation<double> get _size => listenable;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            alignment: Alignment.centerRight,
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Text(
              " Today ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ),
        Text(
          " O F F E R ! ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: _size.value,
            color: mycustomColor(),
          ),
        ),
        Flexible(
          child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Text(
              " Available ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

Color mycustomColor() {
  _color = _randomColor.randomColor();
  return _color;
}
