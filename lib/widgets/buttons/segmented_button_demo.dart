import 'package:flutter/material.dart';

class SegmentedButtonDemo extends StatefulWidget {
  const SegmentedButtonDemo({super.key});

  @override
  State<SegmentedButtonDemo> createState() => _SegmentedButtonDemoState();
}

class _SegmentedButtonDemoState extends State<SegmentedButtonDemo> {
  Set<int> values = {};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      multiSelectionEnabled: true,
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      style: const ButtonStyle().copyWith(
        backgroundColor: _resolveButtonColors(Colors.greenAccent, Colors.grey),
        foregroundColor: _resolveButtonColors(Colors.yellow, Colors.brown),
        iconColor: _resolveButtonColors(Colors.purpleAccent, Colors.yellow),
      ),
      segments: const [
        ButtonSegment(
          value: 1,
          label: Text('First option'),
          icon: Icon(Icons.sunny),
        ),
        ButtonSegment(
          value: 2,
          label: Text('Second option'),
          icon: Icon(Icons.cloud),
        ),
        ButtonSegment(
          value: 3,
          label: Text('Third option'),
          icon: Icon(Icons.snowing),
        ),
      ],
      selected: values,
      onSelectionChanged: (p0) {
        setState(() {
          values = p0;
        });
      },
    );
  }

  WidgetStateProperty<Color> _resolveButtonColors(Color selected, Color unselected) => WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? selected : unselected,
      );
}
