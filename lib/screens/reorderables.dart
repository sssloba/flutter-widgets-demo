import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class Reorderables extends StatefulWidget {
  const Reorderables({Key? key}) : super(key: key);

  @override
  State<Reorderables> createState() => _ReorderablesState();
}

class _ReorderablesState extends State<Reorderables> {
  final List<Widget> _reordableList = <Widget>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      _reordableList.add(
        Card(
          key: ValueKey(i),
          color: color,
          child: ListTile(
            title: Text('Item ${i + 1}'),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Reordable List'),
      ),
      body: ReorderableListView(
          header: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Press and hold item to reorder tham',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: _reordableList,
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              final int index = newIndex > oldIndex ? newIndex - 1 : newIndex;
              final Widget item = _reordableList.removeAt(oldIndex);
              _reordableList.insert(index, item);
            });
          }),
    );
  }
}
