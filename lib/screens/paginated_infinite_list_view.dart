import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class PaginatedListView extends StatefulWidget {
  const PaginatedListView({super.key});

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  final ScrollController scrollController = ScrollController();
  static const int paginationItems = 20;
  int totalItems = paginationItems;
  List<String> items = List.generate(paginationItems, (i) => 'Item ${i + 1}');

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_listener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_listener);
    scrollController.dispose();
    super.dispose();
  }

  void _listener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      Future.delayed(const Duration(milliseconds: 600)).then((_) {
        setState(() {
          final List<String> newItems = List.generate(
              paginationItems, (i) => 'Item ${totalItems + i + 1}');
          items.addAll(newItems);
          totalItems += paginationItems;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Paginated List View'),
      ),
      backgroundColor: const Color.fromARGB(255, 78, 77, 75),
      body: ListView.builder(
        controller: scrollController,
        itemCount: items.length + 1,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        itemBuilder: (context, index) {
          return index < items.length
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Center(child: Text(items[index])),
                    tileColor: const Color.fromARGB(255, 211, 210, 158),
                    shape: const StadiumBorder(),
                    onTap: () {},
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Color.fromARGB(255, 187, 171, 151),
                    backgroundColor: Color.fromARGB(255, 128, 124, 141),
                  )),
                );
        },
      ),
    );
  }
}
