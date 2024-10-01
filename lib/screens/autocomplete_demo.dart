import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class AutocompleteDemo extends StatefulWidget {
  const AutocompleteDemo({super.key});

  @override
  State<AutocompleteDemo> createState() => _AutocompleteDemoState();
}

class _AutocompleteDemoState extends State<AutocompleteDemo> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          'Autocomplete Demo',
        ),
      ),
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
              Autocomplete<AutocompleteModel>(
                optionsBuilder: (textEditingValue) {
                  if (textEditingValue.text.trim().isEmpty) {
                    return const Iterable.empty();
                  }
                  if (textEditingValue.text.trim() == '@all') {
                    return AutocompleteModel.mockList;
                  }
                  return AutocompleteModel.mockList
                      .where((e) => e.name
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()))
                      .toList();
                },
                optionsMaxHeight: 500,
                // initialValue: const TextEditingValue(text: 'test'),
                // optionsViewOpenDirection: OptionsViewOpenDirection.values
                //     .elementAt(Random().nextInt(2)),
                displayStringForOption:
                    //RawAutocomplete.defaultStringForOption,
                    (option) {
                  return option.name;
                },
                onSelected: (option) {
                  setState(() {
                    selectedItem =
                        'Item number ${AutocompleteModel.mockList.indexOf(option) + 1}:\n${option.name}\nItem id: ${option.id}\nItem description: ${option.description}';
                  });
                },
                optionsViewBuilder: (context, onSelected, options) {
                  final items = options.toList();
                  return ListView.builder(
                    itemCount: items.length,
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 48.0, 48.0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () => onSelected(items[index]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                        color: Colors.greenAccent),
                                  ),
                                  Text('Item id: ${items[index].id}'),
                                  Text(
                                    'Description: ${items[index].description}',
                                  )
                                ]),
                          ),
                        ),
                      );
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

class AutocompleteModel {
  final String name;
  final String description;
  final String id;

  AutocompleteModel({
    required this.name,
    required this.description,
    required this.id,
  });

  static List<AutocompleteModel> mockList = [
    AutocompleteModel(
      name: 'test',
      description: 'Desription for test: Ad duis occaecat deserunt in.',
      id: '1111',
    ),
    AutocompleteModel(
      name: 'test 2',
      description:
          'Desription for test 2: Lorem exercitation incididunt qui voluptate ipsum laboris adipisicing qui irure id.',
      id: '2222',
    ),
    AutocompleteModel(
      name: 'auto test',
      description:
          'Eiusmod id voluptate eiusmod aliqua pariatur tempor veniam pariatur aute minim amet eiusmod sunt aliquip.',
      id: '3333',
    ),
    AutocompleteModel(
      name: 'Temporary',
      description:
          'Tempor Lorem velit elit ex occaecat nostrud ad non incididunt pariatur.',
      id: '4444',
    ),
    AutocompleteModel(
      name: 'Exception m2',
      description: 'Excepteur enim qui consequat deserunt non sint consequat.',
      id: '5555',
    ),
    AutocompleteModel(
      name: 'Ilyada',
      description:
          'Eu in aliqua sit consequat esse do consectetur aliquip et velit nisi.',
      id: '6666',
    ),
    AutocompleteModel(
      name: 'Uncle BOB',
      description:
          'Ullamco in Lorem laboris ut nostrud aliquip aliqua velit aliqua et anim cillum mollit do.',
      id: '1111',
    ),
    AutocompleteModel(
      name: 'Commodore 64',
      description:
          'Commodo occaecat et nulla aliquip consequat irure aliqua ullamco.',
      id: '7777',
    ),
    AutocompleteModel(
      name: 'Dolar',
      description:
          'Dolor ipsum eiusmod cillum aliquip nulla laborum culpa do adipisicing est in.',
      id: '8888',
    ),
    AutocompleteModel(
      name: 'Maximum',
      description:
          'Pariatur eiusmod labore consectetur elit esse anim qui tempor velit laborum irure consequat.',
      id: '9999',
    ),
    AutocompleteModel(
      name: 'Minimum',
      description:
          'Minim veniam enim cupidatat eiusmod eiusmod veniam ut ullamco aute adipisicing proident laboris.',
      id: '1010',
    ),
  ];
}
