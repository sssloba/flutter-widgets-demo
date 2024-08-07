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
      body: Column(
        children: [
          ClipPath(
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
          Stack(
            children: [
              ClipPath(
                clipper: _CustomClipPathFromShapeMaker(),
                child: Container(
                  color: Colors.orange,
                  height: 300,
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 120,
                width: 200,
                child: Center(
                  child: Text(
                    'Custom Clip with Shapemaker',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
    path.lineTo(w, 150); // 5. point
    path.quadraticBezierTo(
      w - 100, // 6. point
      h * 0.1, // 6. point
      w, // 7. point
      50, // 7. point
    );
    path.lineTo(w, 0); // 8. point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// custom clip created from:
// https://fluttershapemaker.com/
class _CustomClipPathFromShapeMaker extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.3180833, size.height * 0.3352429);
    path.lineTo(size.width * 0.0613333, size.height * 0.9655857);
    path.quadraticBezierTo(size.width * 0.2744917, size.height * 0.6456286,
        size.width * 0.7998167, size.height * 0.8452571);
    path.quadraticBezierTo(size.width * 0.3791417, size.height * 0.6056000,
        size.width * 0.3180833, size.height * 0.3352429);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
