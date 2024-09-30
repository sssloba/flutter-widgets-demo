import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class AutocompleteDemo extends StatefulWidget {
  const AutocompleteDemo({super.key});

  @override
  State<AutocompleteDemo> createState() => _AutocompleteDemoState();
}

class _AutocompleteDemoState extends State<AutocompleteDemo> {
  static const options = <String>['test', 'test2', 'auto test'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Autocomplete Demo'),
      ),
      body: Center(
        child: Autocomplete<String>(optionsBuilder: (textEditingValue) {
          return options
              .where((e) => e.contains(textEditingValue.text))
              .toList();
        }),
      ),
    );
  }
}
