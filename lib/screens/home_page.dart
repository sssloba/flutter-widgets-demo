import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Flutter Widgets Demo Home Page'),
      ),
      body: const Center(
        child: Text(
          'Flutter Widgets Demo Home Page \n Open Drawer for Options',
          style: TextStyle(
              fontSize: 24.0,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
              height: 1.8),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
