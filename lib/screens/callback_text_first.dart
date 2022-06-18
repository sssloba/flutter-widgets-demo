import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/screens/calback_text_second.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class CallbackTextFirst extends StatefulWidget {
  const CallbackTextFirst({Key? key}) : super(key: key);

  @override
  State<CallbackTextFirst> createState() => _CallbackTextFirstState();
}

class _CallbackTextFirstState extends State<CallbackTextFirst> {
  String _callbackText = 'Callback Editable Text';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Callback Editable Text'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _callbackText,
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CallbackTextSecond(
                        initialText: _callbackText,
                        onChange: (value) {
                          _callbackText = value;
                          setState(() {});
                        },
                      ))),
              child: const Text('Edit text')),
        ],
      )),
    );
  }
}
