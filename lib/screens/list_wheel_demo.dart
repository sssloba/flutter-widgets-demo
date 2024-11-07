import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class ListWheelDemo extends StatefulWidget {
  const ListWheelDemo({super.key});

  @override
  State<ListWheelDemo> createState() => _ListWheelDemoState();
}

class _ListWheelDemoState extends State<ListWheelDemo> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('List Wheel Demo'),
      ),
      body: Stack(
        children: [
          Center(
            child: ListWheelScrollView(
              itemExtent: 200,
              diameterRatio: 2.0,
              perspective: 0.005,
              useMagnifier: true,
              magnification: 1.2,
              offAxisFraction: -0.5,
              overAndUnderCenterOpacity: 0.5,
              squeeze: 2,
              onSelectedItemChanged: (value) => setState(() {
                selectedItem = value;
              }),
              children: [
                Container(
                  width: 200,
                  color: Colors.red,
                ),
                Container(
                  width: 70,
                  color: Colors.blue,
                ),
                Container(
                  width: 220,
                  color: Colors.green,
                ),
                Container(
                  width: 150,
                  color: Colors.yellow,
                ),
                Container(
                  width: 20,
                  color: Colors.red,
                ),
                Container(
                  width: 130,
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
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Selected Item: $selectedItem',
              style: const TextStyle(fontSize: 28.0),
            ),
          )
        ],
      ),
    );
  }
}
