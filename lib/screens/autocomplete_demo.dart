import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class AutocompleteDemo extends StatefulWidget {
  const AutocompleteDemo({super.key});

  @override
  State<AutocompleteDemo> createState() => _AutocompleteDemoState();
}

class _AutocompleteDemoState extends State<AutocompleteDemo> {
  static const autocompleteOptions = <String>[
    'test',
    'test 2',
    'auto test',
    'Tessy',
    'Lessy',
    'Lilly',
    'Ally',
    'Lessy 2',
    'Lilly 23',
    'Ally 25',
  ];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
          title: const Text(
        'Autocomplete Demo',
      )),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Type "@all" to see all autocomplete options',
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                ),
              ),
              Autocomplete<String>(
                optionsBuilder: (textEditingValue) {
                  if (textEditingValue.text.trim().isEmpty) {
                    return const Iterable.empty();
                  }
                  if (textEditingValue.text.trim() == '@all') {
                    return autocompleteOptions;
                  }
                  return autocompleteOptions
                      .where((e) => e
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()))
                      .toList();
                },
                optionsMaxHeight: 500,
                // initialValue: const TextEditingValue(text: 'test'),
                // optionsViewOpenDirection: OptionsViewOpenDirection.values
                //     .elementAt(Random().nextInt(2)),
                // displayStringForOption:
                //     //RawAutocomplete.defaultStringForOption,
                //     (option) {
                //   return 'Match ${options.indexOf(option) + 1}: $option';
                // },
                onSelected: (option) {
                  setState(() {
                    selectedItem =
                        'Item number ${autocompleteOptions.indexOf(option) + 1}:\n$option';
                  });
                },
                optionsViewBuilder: (context, onSelected, options) {
                  final items = options.toList();
                  return ListView.builder(
                    itemCount: items.length,
                    padding: const EdgeInsets.only(right: 36.0),
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                          onPressed: () => onSelected(items[index]),
                          child: Text(items[index]));
                    },
                  );
                },
              ),
              const SizedBox(height: 30.0),
              Text(selectedItem == null
                  ? 'Nothing selected'
                  : 'Selected item is:'),
              if (selectedItem != null)
                Text(
                  selectedItem!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
