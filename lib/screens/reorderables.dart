import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class Reorderables extends StatefulWidget {
  const Reorderables({Key? key}) : super(key: key);

  @override
  State<Reorderables> createState() => _ReorderablesState();
}

class _ReorderablesState extends State<Reorderables> {
  final List<_ReorderableItem> reordableList = <_ReorderableItem>[];
  final List<String> titles = <String>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 12; i++) {
      final ValueKey key = ValueKey(i);
      String title = 'Item ${i + 1}';
      titles.add('Item ${i + 1}');
      reordableList.add(_ReorderableItem(
        key: key,
        title: title,
        onDelete: () {
          setState(() {
            reordableList.removeWhere((element) => element.key == key);
          });
        },
        onEdit: () {},
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Reordable List'),
      ),
      body: ReorderableListView.builder(
        itemCount: reordableList.length,
        header: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Press and hold item to reorder them',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        itemBuilder: (BuildContext context, int index) {
          return reordableList.elementAt(index);
        },
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            final int index = newIndex > oldIndex ? newIndex - 1 : newIndex;
            final _ReorderableItem item = reordableList.removeAt(oldIndex);
            reordableList.insert(index, item);
          });
        },
      ),
    );
  }
}

class _ReorderableItem extends StatefulWidget {
  const _ReorderableItem({
    Key? key,
    required this.title,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  final String title;
  final Function() onDelete;
  final Function() onEdit;

  @override
  State<_ReorderableItem> createState() => _ReorderableItemState();
}

class _ReorderableItemState extends State<_ReorderableItem> {
  late String _title;
  final Color randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  @override
  void initState() {
    super.initState();
    _title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: randomColor,
      child: ListTile(
        title: Text(_title),
        trailing: SizedBox(
          width: 80.0,
          child: Row(
            children: [
              Expanded(
                  child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        setState(() {
                          _title = 'title edited';
                        });
                        widget.onEdit;
                      })),
              Expanded(
                  child: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: widget.onDelete)),
            ],
          ),
        ),
      ),
    );
  }
}
