import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class BadgeDemo extends StatefulWidget {
  const BadgeDemo({super.key});

  @override
  State<BadgeDemo> createState() => _BadgeDemoState();
}

class _BadgeDemoState extends State<BadgeDemo> {
  int badgeCount = 0;
  String toggleBadgeLabel = 'OFF';
  IconData toggleIcon = Icons.switch_left_sharp;
  Color toggleBadgeColor = Colors.red;
  double toggleBadgeHorizontalAlignemt = -1.95;

  void _toggleBadge() {
    setState(() {
      toggleBadgeLabel = toggleBadgeLabel == 'ON' ? 'OFF' : 'ON';
      toggleBadgeColor =
          toggleBadgeColor == Colors.green ? Colors.red : Colors.green;
      toggleIcon = toggleIcon == Icons.switch_left_sharp
          ? Icons.switch_right_sharp
          : Icons.switch_left_sharp;
      toggleBadgeHorizontalAlignemt =
          toggleBadgeHorizontalAlignemt == 0.5 ? -1.95 : 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          'Badge Demo',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Press Increment Button for Badge Counting'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      badgeCount++;
                    });
                  },
                  child: const Text('Increment')),
            ),
            IconButton(
              onPressed: () {},
              icon: Badge.count(
                count: badgeCount,
                child: const Icon(Icons.notifications),
              ),
            ),
            const SizedBox(height: 50),
            const Text('Press Toggle Button'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _toggleBadge,
                child: const Text('Toggle'),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Badge(
                label: Text(toggleBadgeLabel),
                padding: const EdgeInsets.all(24),
                alignment: Alignment(toggleBadgeHorizontalAlignemt, -0.8),
                backgroundColor: toggleBadgeColor,
                child: Icon(
                  toggleIcon,
                  size: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
