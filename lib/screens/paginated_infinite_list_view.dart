import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class PaginatedListView extends StatefulWidget {
  const PaginatedListView({super.key});

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  final ScrollController scrollController = ScrollController();
  static const int paginationItems = 10;
  int totalItems = paginationItems;
  bool isLoading = false;
  bool toggleColor = true;
  late List<(String, Color)> items;

  @override
  void initState() {
    super.initState();
    items = List.generate(paginationItems, (i) => ('Item ${i + 1}', tileColor));
    scrollController.addListener(_listener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_listener);
    scrollController.dispose();
    super.dispose();
  }

  Color get tileColor => toggleColor
      ? const Color.fromARGB(255, 211, 210, 158)
      : const Color.fromARGB(255, 164, 182, 160);

  void _listener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset &&
        !isLoading) {
      isLoading = true;
      toggleColor = !toggleColor;
      Future.delayed(const Duration(milliseconds: 800)).then((_) {
        setState(() {
          final List<(String, Color)> newItems = List.generate(paginationItems,
              (i) => ('Item ${totalItems + i + 1}', tileColor));
          items.addAll(newItems);
          totalItems += paginationItems;
          isLoading = false;
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
                    title: Center(child: Text(items[index].$1)),
                    tileColor: items[index].$2,
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
                    ),
                  ),
                );
        },
      ),
    );
  }
}
