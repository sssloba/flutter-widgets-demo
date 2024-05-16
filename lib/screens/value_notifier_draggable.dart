import 'package:flutter/material.dart';

class ValueNotifierDraggable extends StatefulWidget {
  const ValueNotifierDraggable({Key? key}) : super(key: key);

  @override
  State<ValueNotifierDraggable> createState() => _ValueNotifierDraggableState();
}

class _ValueNotifierDraggableState extends State<ValueNotifierDraggable> {
  ValueNotifier<List<double>> posValueListener = ValueNotifier([0.0, 0.0]);
  ValueChanged<List<double>>? posValueChanged;
  double _horizontalPos = 0.0;
  double _verticalPos = 0.0;

  @override
  void initState() {
    super.initState();

    posValueListener.addListener(() {
      if (posValueChanged != null) {
        posValueChanged!(posValueListener.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      _buildDraggable(),
    ]));
  }

  _buildDraggable() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(bottom: 100),
        color: Colors.green,
        child: Builder(
          builder: (context) {
            final handle = GestureDetector(
                onPanUpdate: (details) {
                  _verticalPos =
                      (_verticalPos + details.delta.dy / (context.size!.height))
                          .clamp(.0, 1.0);
                  _horizontalPos = (_horizontalPos +
                          details.delta.dx / (context.size!.width))
                      .clamp(.0, 1.0);
                  posValueListener.value = [_horizontalPos, _verticalPos];
                },
                child: Container(
                  margin: const EdgeInsets.all(12),
                  width: 110.0,
                  height: 170.0,
                  child: Container(
                    color: Colors.black87,
                    child: const Center(
                        child: Text(
                      'Drag me!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )),
                  ),
                  decoration: const BoxDecoration(color: Colors.red),
                ));

            return ValueListenableBuilder<List<double>>(
              valueListenable: posValueListener,
              builder:
                  (BuildContext context, List<double> value, Widget? child) {
                return Align(
                  alignment: Alignment(value[0] * 2 - 1, value[1] * 2 - 1),
                  child: handle,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
