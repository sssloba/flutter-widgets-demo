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
            expandedHeight: 300,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 36.0, horizontal: 16.0),
                  child: Text(
                    'Sliver List starts here!',
                    textScaler: TextScaler.linear(1.4),
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.blue,
                ),
                Container(
                  height: 200,
                  color: Colors.yellow,
                ),
                Container(
                  height: 250,
                  color: Colors.greenAccent,
                ),
                Container(
                  height: 50,
                  color: Colors.yellow[900],
                ),
                Container(
                  height: 130,
                  color: Colors.blue,
                ),
                Container(
                  height: 400,
                  color: Colors.deepOrange,
                ),
                Container(
                  height: 350,
                  color: Colors.deepPurple,
                ),
                Container(
                  height: 40,
                  color: Colors.cyan,
                ),
                Container(
                  height: 70,
                  color: Colors.blue,
                ),
                Container(
                  height: 150,
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
