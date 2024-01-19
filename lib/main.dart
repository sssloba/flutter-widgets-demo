import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Banner(
          message: 'Widgets Demo',
          location: BannerLocation.bottomEnd,
          child: HomePage()),
    );
  }
}
