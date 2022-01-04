import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  const AnimatedCrossFadeDemo({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _isFirstChild = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Animated Cross Fade Demo'),
      ),
      body: Stack(
        children: [
          Center(
            child: AnimatedCrossFade(
              firstChild: Container(
                color: Colors.red,
                width: 350.0,
                height: 250.0,
              ),
              secondChild: Container(
                color: Colors.blue,
                width: 200.0,
                height: 450.0,
              ),
              crossFadeState: _isFirstChild
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 2),
              reverseDuration: const Duration(seconds: 9),
              firstCurve: Curves.bounceIn,
              secondCurve: Curves.easeIn,
              sizeCurve: Curves.decelerate,
            ),
          ),
          Positioned(
            top: 20.0,
            left: 20.0,
            right: 20.0,
            child: Center(
              child: ElevatedButton(
                onPressed: () => setState(() => _isFirstChild = !_isFirstChild),
                child: const Text('Switch'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
