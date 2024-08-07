import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class BezierCurvesDemo extends StatelessWidget {
  const BezierCurvesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Bezier Curves Demo'),
      ),
      body: ClipPath(
        clipper: _CustomClipPath(),
        child: Container(
          color: Colors.green,
          height: 400,
          width: 300,
          child: const Center(
            child: Text(
              'Bezier Curve with Clip Path',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.moveTo(0, 100); // 1. point
    path.lineTo(0, h); // 2. point
    path.quadraticBezierTo(
      w * 0.5, // 3. point
      h - 200, // 3. point
      w, // 4. point
      h, // 4. point
    );
    path.lineTo(w, h); // 4. point
    path.lineTo(w, 0); // 5. point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
