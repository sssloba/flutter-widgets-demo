import 'package:flutter/material.dart';

class DualStateButton extends StatefulWidget {
  const DualStateButton({
    required this.title,
    required this.onConfirm,
    this.onCancel,
    this.animationDuration = 300,
    super.key,
  });

  final String title;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final int animationDuration;

  @override
  State<DualStateButton> createState() => _DualStateButtonState();
}

class _DualStateButtonState extends State<DualStateButton> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: widget.animationDuration),
        child: _focusNode.hasFocus
            ? _DualButtonSection(
                firstButtonText: 'Cancel',
                firstButtonOnPressed: () {
                  if (widget.onCancel != null) {
                    widget.onCancel!();
                  }
                  _focusNode.unfocus();
                },
                secondButtonText: 'Confirm',
                secondButtonOnPressed: () {
                  widget.onConfirm();
                  _focusNode.unfocus();
                })
            : _DualButtonItem(
                text: widget.title,
                onPressed: () {
                  _focusNode.requestFocus();
                },
              ),
      ),
    );
  }
}

class _DualButtonSection extends StatelessWidget {
  const _DualButtonSection({
    required this.firstButtonText,
    required this.firstButtonOnPressed,
    required this.secondButtonText,
    required this.secondButtonOnPressed,
  });

  final String firstButtonText;
  final VoidCallback firstButtonOnPressed;
  final String secondButtonText;
  final VoidCallback secondButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _DualButtonItem(
            text: firstButtonText,
            onPressed: firstButtonOnPressed,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _DualButtonItem(
            text: secondButtonText,
            onPressed: secondButtonOnPressed,
          ),
        ),
      ],
    );
  }
}

class _DualButtonItem extends StatelessWidget {
  const _DualButtonItem({
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        onPressed: onPressed,
        child: SizedBox(
          height: 55,
          child: Center(
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}
