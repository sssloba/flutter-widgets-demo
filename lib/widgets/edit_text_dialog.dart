import 'package:flutter/material.dart';

class EditTextDialog extends StatefulWidget {
  const EditTextDialog({Key? key, this.initialText}) : super(key: key);
  final String? initialText;

  @override
  State<EditTextDialog> createState() => _EditTextDialogState();
}

class _EditTextDialogState extends State<EditTextDialog> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialText != null) {
      _textEditingController.text = widget.initialText!;
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit text'),
      content: TextField(
        controller: _textEditingController,
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, _textEditingController.text),
          child: const Text(
            'Edit',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
