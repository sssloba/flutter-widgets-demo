import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';
import 'package:flutter_widgets_demo/widgets/buttons/dual_state_button.dart';
import 'package:flutter_widgets_demo/widgets/buttons/expanded_button.dart';
import 'package:flutter_widgets_demo/widgets/buttons/segmented_button_demo.dart';

class CustomButtonsDemo extends StatelessWidget {
  const CustomButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Custom Buttons Demo'),
      ),
      body: ListView(padding: const EdgeInsets.all(32), children: [
        ExpandedButton(
          title: 'Expanded Button - Click Me',
          content: 'This is the expanded button content info',
          children: [
            const Text('Child could be the text'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Child could be the button'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        DualStateButton(title: 'Dual State Button - Click Me', onConfirm: () {}),
        const SizedBox(height: 20),
        const SegmentedButtonDemo()
      ]),
    );
  }
}
