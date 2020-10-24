import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_color/circle_clipper.dart';
import 'package:random_color/palettes.dart';

import 'color_page.dart';

void main() {
  runApp(MyApp(
    transitionDuration: Duration(milliseconds: 500),
  ));
}

class MyApp extends StatefulWidget {
  final Duration transitionDuration;

  const MyApp({Key key, this.transitionDuration}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  final Random _rnd = Random();
  AnimationController _controller;
  Animation<double> _transitionAnimation;
  int _currentPageIndex = 0;
  int _nextPageIndex;
  Offset _tapOffset;

  _MyAppState() {
    _controller = AnimationController(
      duration: widget.transitionDuration,
      vsync: this,
    );
    _controller.addListener(this._animationListener);

    _transitionAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  Widget _buildPageByIndex(int index) {
    return ColorPage(
      palette: palettes[index],
      textOpacity: 1.0,
    );
  }

  void _onTapDown(TapDownDetails details) {
    if (_nextPageIndex != null) return;
    setState(() {
      _nextPageIndex = _rnd.nextInt(palettes.length - 1) + 1;
      _tapOffset = Offset(
        details.localPosition.dx,
        details.localPosition.dy,
      );
      _controller.reset();
      _controller.forward();
    });
  }

  void _animationListener() {
    if (!_controller.isCompleted) return;

    setState(() {
      _currentPageIndex = _nextPageIndex;
      _nextPageIndex = null;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Color Example',
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          GestureDetector(
            child: this._buildPageByIndex(_currentPageIndex),
            onTapDown: this._onTapDown,
          ),
          if (_nextPageIndex != null)
            AnimatedBuilder(
              animation: this._controller,
              builder: (context, child) {
                return ClipPath(
                  clipper: CircleClipper(
                      _tapOffset,
                      20.0,
                      this._transitionAnimation.value
                  ),
                  child: this._buildPageByIndex(_nextPageIndex),
                );
              },
            )
        ],
      ),
    );
  }
}
