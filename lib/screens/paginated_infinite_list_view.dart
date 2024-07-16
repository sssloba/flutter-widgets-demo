import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class PaginatedListView extends StatefulWidget {
  const PaginatedListView({super.key});

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  List<String> items = List.generate(100, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Paginated List View'),
      ),
      backgroundColor: const Color.fromARGB(255, 78, 77, 75),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Center(child: Text(items[index])),
              tileColor: const Color.fromARGB(255, 211, 210, 158),
              shape: const StadiumBorder(),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
