import 'package:flutter/material.dart';

class CallbackTextSecond extends StatefulWidget {
  const CallbackTextSecond({Key? key, this.onChange, required this.initialText})
      : super(key: key);
  final String initialText;
  final Function(String)? onChange;

  @override
  State<CallbackTextSecond> createState() => _CallbackTextSecondState();
}

class _CallbackTextSecondState extends State<CallbackTextSecond> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _textEditingController.text = widget.initialText;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              autofocus: true,
              controller: (_textEditingController),
              onChanged: widget.onChange,
            ),
          ),
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to the previous screen'))
        ],
      )),
    );
  }
}
