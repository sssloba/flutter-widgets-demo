import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class CarouselViewDemo extends StatelessWidget {
  const CarouselViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Carousel View Demo'),
      ),
      // CarouselView is new in Flutter 3.24.0 version
      body: const CarouselView(
        itemExtent: 300,
        children: [
          ColoredBox(
            color: Colors.blue,
            child: SizedBox(
              height: 50,
              width: 50,
            ),
          ),
          ColoredBox(
            color: Colors.green,
            child: SizedBox(
              height: 150,
              width: 50,
            ),
          ),
          ColoredBox(
            color: Colors.red,
            child: SizedBox(
              height: 50,
              width: 150,
            ),
          ),
          ColoredBox(
            color: Colors.yellow,
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          ),
          ColoredBox(
            color: Colors.purple,
            child: SizedBox(
              height: 150,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
