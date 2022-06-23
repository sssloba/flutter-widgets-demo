import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';
import 'package:flutter_widgets_demo/widgets/edit_text_dialog.dart';
import 'package:uuid/uuid.dart';

class Reorderables extends StatefulWidget {
  const Reorderables({Key? key}) : super(key: key);

  @override
  State<Reorderables> createState() => _ReorderablesState();
}

class _ReorderablesState extends State<Reorderables> {
  final List<_ReorderableItem> reordableList = <_ReorderableItem>[];
  final List<int> itemNumber = <int>[0];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 12; i++) {
      final uuid = const Uuid().v1();
      final ValueKey key = ValueKey(uuid);
      itemNumber.add(i + 1);
      String title = 'Item ${itemNumber.last}';
      reordableList.add(_ReorderableItem(
        key: key,
        title: title,
        onDelete: () {
          setState(() {
            reordableList.removeWhere((element) => element.key == key);
          });
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Reorderable List'),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            final uuid = const Uuid().v1();
            final ValueKey key = ValueKey(uuid);
            itemNumber.add(itemNumber.last + 1);
            String title = 'Item ${itemNumber.last}';
            reordableList.add(_ReorderableItem(
              key: key,
              title: title,
              onDelete: () {
                setState(() {
                  reordableList.removeWhere((element) => element.key == key);
                });
              },
            ));
          });
        },
        label: Row(
          children: const [
            Icon(
              Icons.add,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Add Item'),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _ReorderableItem extends StatefulWidget {
  const _ReorderableItem({
    Key? key,
    required this.title,
    required this.onDelete,
  }) : super(key: key);

  final String title;
  final Function() onDelete;

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
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (context) => EditTextDialog(
                                  initialText: _title,
                                )).then(
                          (value) => setState(() {
                            _title = value;
                          }),
                        );
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
