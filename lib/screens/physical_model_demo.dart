import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class PhysicalModelDemo extends StatelessWidget {
  const PhysicalModelDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Physical Model Demo')),
      body: Center(
        child: PhysicalModel(
          // clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(15),
          // shape: BoxShape.circle,
          elevation: 23,
          color: Colors.green.withValues(alpha: 0.3),
          shadowColor: Colors.red,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(15),
            ),
            width: 200,
            height: 200,
            child: const Center(
              child: Text(
                'Physical Model Demo',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
