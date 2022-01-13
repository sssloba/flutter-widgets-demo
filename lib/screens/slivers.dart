import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class Slivers extends StatelessWidget {
  const Slivers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              'Sliver App Bar',
            ),
            floating: true,
            snap: true,
            backgroundColor: Colors.purple,
            foregroundColor: Colors.green,
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 350,
                  color: Colors.blue,
                ),
                Container(
                  height: 600,
                  color: Colors.yellow,
                ),
                Container(
                  height: 250,
                  color: Colors.greenAccent,
                ),
                Container(
                  height: 350,
                  color: Colors.yellow[900],
                ),
                Container(
                  height: 350,
                  color: Colors.blue,
                ),
                Container(
                  height: 350,
                  color: Colors.deepOrange,
                ),
                Container(
                  height: 350,
                  color: Colors.deepPurple,
                ),
                Container(
                  height: 350,
                  color: Colors.cyan,
                ),
                Container(
                  height: 350,
                  color: Colors.blue,
                ),
                Container(
                  height: 350,
                  color: Colors.yellow,
                ),
                Container(
                  height: 20,
                  color: Colors.blue,
                ),
                Container(
                  height: 50,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
