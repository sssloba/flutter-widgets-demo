import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class StatefulBuilderDemo extends StatelessWidget {
  const StatefulBuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color demoColor = Colors.green;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Builder Demo'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          StatefulBuilder(
            builder: (context, setState) {
              return GestureDetector(
                onTap: () => setState(() {
                  demoColor = Color.fromARGB(
                    255,
                    Random().nextInt(255),
                    Random().nextInt(255),
                    Random().nextInt(255),
                  );
                }),
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  color: demoColor,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Tap here to change Color with Stateful Builder',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            height: 150.0,
            width: 200.0,
            color: demoColor,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'All other elements are Stateless. This box uses the same color variable as Stateful Box',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
