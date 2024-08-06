import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class OverflowBarDemo extends StatefulWidget {
  const OverflowBarDemo({super.key});

  @override
  State<OverflowBarDemo> createState() => _OverflowBarDemoState();
}

class _OverflowBarDemoState extends State<OverflowBarDemo> {
  double width = 400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Overflow Bar Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () {
                setState(() {
                  width = width == 400 ? 200 : 400;
                });
              },
              child: const Text('Press to resize box'),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              color: Colors.red,
              height: 300,
              width: width,
              child: Center(
                child: OverflowBar(
                  spacing: 15,
                  overflowSpacing: 10,
                  alignment: MainAxisAlignment.center,
                  overflowAlignment: OverflowBarAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: const Text('Button 1'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: const Text('Button 2'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: const Text('Button 3'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
