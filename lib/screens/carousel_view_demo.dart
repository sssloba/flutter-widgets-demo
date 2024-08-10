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
      body: SizedBox(
        height: 300,
        child: CarouselView(
          controller: CarouselController(initialItem: 3),
          itemSnapping: true,
          elevation: 20,
          backgroundColor: Colors.transparent,
          itemExtent: 300,
          children: const [
            Center(
              child: ColoredBox(
                color: Colors.blue,
                child: SizedBox(
                  height: 50,
                  width: 50,
                ),
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
            Center(
              child: ColoredBox(
                color: Colors.yellow,
                child: SizedBox(
                  height: 400,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Scroll left and right',
                    ),
                  ),
                ),
              ),
            ),
            ColoredBox(
              color: Colors.purple,
              child: SizedBox(
                height: 150,
                width: 150,
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: ColoredBox(
                  color: Colors.blueGrey,
                  child: SizedBox(
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
