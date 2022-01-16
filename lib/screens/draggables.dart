import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class Draggables extends StatefulWidget {
  const Draggables({Key? key}) : super(key: key);

  @override
  _DraggablesState createState() => _DraggablesState();
}

class _DraggablesState extends State<Draggables> {
  double _targetSize = 200.0;
  Color _targetColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Draggables'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Draggable<Color>(
              data: Colors.cyan,
              child: Container(
                color: Colors.lightBlue,
                width: 50.0,
                height: 50.0,
              ),
              childWhenDragging: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.grey,
              ),
              feedback: Container(
                color: Colors.amber[200],
                height: 80.0,
                width: 80.0,
              ),
            ),
            DragTarget(
                onAccept: (data) => setState(() {
                      _targetSize = 20.0;
                      _targetColor = Colors.green;
                    }),
                onLeave: (data) => setState(() {
                      _targetSize = 200.0;
                      _targetColor = Colors.red;
                    }),
                onMove: (details) => setState(() {
                      _targetColor = Colors.orange;
                    }),
                builder: (BuildContext context, List<Object?> candidates,
                    List<dynamic> rejects) {
                  return Container(
                    width: _targetSize,
                    height: _targetSize,
                    color: _targetColor,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
