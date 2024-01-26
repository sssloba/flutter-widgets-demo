import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class DropDownDemo extends StatefulWidget {
  const DropDownDemo({Key? key}) : super(key: key);

  @override
  State<DropDownDemo> createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String _selected = 'Nothing selected';
  Color? _selectedColor;
  late final TextEditingController _textEditingController;
  String? _hintText;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Drop Down Demo'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _selected,
                  style: TextStyle(fontSize: 28, color: _selectedColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownMenu(
                  label: const Text('Select Color'),
                  hintText: _hintText,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  helperText: 'You can filter colors by typing',
                  controller: _textEditingController,
                  dropdownMenuEntries: const <DropdownMenuEntry<Color>>[
                    DropdownMenuEntry<Color>(value: Colors.red, label: 'Red'),
                    DropdownMenuEntry<Color>(value: Colors.blue, label: 'Blue'),
                    DropdownMenuEntry<Color>(
                        value: Colors.green, label: 'Green'),
                    DropdownMenuEntry<Color>(
                        value: Colors.yellow, label: 'Yellow'),
                  ],
                  onSelected: (Color? value) {
                    setState(() {
                      _hintText = _textEditingController.text;
                      _textEditingController.clear();
                      _selectedColor = value;
                      _selected = 'Selected color is: $value';
                    });
                  },
                  width: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
