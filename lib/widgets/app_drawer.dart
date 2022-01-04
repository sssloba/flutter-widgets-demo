import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/screens/animated_cross_fade_demo.dart';
import 'package:flutter_widgets_demo/screens/home_page.dart';
import 'package:flutter_widgets_demo/widgets/drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerTile('Home Page', HomePage()),
          DrawerTile('Animated Cross Fade', AnimatedCrossFadeDemo()),
        ],
      ),
    );
  }
}
