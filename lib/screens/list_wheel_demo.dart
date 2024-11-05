import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class ListWheelDemo extends StatefulWidget {
  const ListWheelDemo({super.key});

  @override
  State<ListWheelDemo> createState() => _ListWheelDemoState();
}

class _ListWheelDemoState extends State<ListWheelDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('List Wheel Demo'),
      ),
      body: Center(
        child: ListWheelScrollView(itemExtent: 200, children: [
          Container(
            width: 200,
            color: Colors.red,
          ),
          Container(
            width: 700,
            color: Colors.blue,
          ),
          Container(
            width: 200,
            color: Colors.green,
          ),
          Container(
            width: 300,
            color: Colors.yellow,
          ),
          Container(
            width: 200,
            color: Colors.red,
          ),
          Container(
            width: 100,
            color: Colors.blue,
          ),
          Container(
            width: 50,
            color: Colors.green,
          ),
          Container(
            width: 300,
            color: Colors.yellow,
          ),
        ]),
      ),
    );
  }
}
