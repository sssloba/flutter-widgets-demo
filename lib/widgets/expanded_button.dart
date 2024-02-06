import 'package:flutter/material.dart';

class ExpandedButton extends StatefulWidget {
  const ExpandedButton({
    required this.title,
    required this.children,
    this.content,
    this.animationDuration = 300,
    this.expandOnStart = false,
    this.titleStyle,
    this.contentStyle,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final String? content;
  final int animationDuration;
  final bool expandOnStart;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;

  @override
  State<ExpandedButton> createState() => _ExpandedButtonState();
}

class _ExpandedButtonState extends State<ExpandedButton> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.expandOnStart) _focusNode.requestFocus();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: AnimatedContainer(
        height: _calculateHeight(),
        width: MediaQuery.sizeOf(context).width,
        duration: Duration(milliseconds: widget.animationDuration),
        alignment: Alignment.topCenter,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          onPressed: () => _focusNode.hasFocus
              ? _focusNode.unfocus()
              : _focusNode.requestFocus(),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 55,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.title,
                            textAlign: TextAlign.end,
                            style: widget.titleStyle,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.content != null
                              ? Container(
                                  constraints:
                                      const BoxConstraints(minHeight: 55),
                                  margin: const EdgeInsets.only(
                                      bottom: 10, top: 18),
                                  child: Text(
                                    widget.content!,
                                    textAlign: TextAlign.center,
                                    style: widget.contentStyle,
                                  ),
                                )
                              : const SizedBox(height: 18),
                          ...widget.children.map(
                            (item) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (widget.children.first != item)
                                  const SizedBox(height: 10),
                                item,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateHeight() {
    if (!_focusNode.hasFocus) return 55;
    final double contentHeight = widget.content != null ? 83 : 18;
    final double childrenHeight =
        widget.children.length * 55 + (widget.children.length - 1) * 10;
    return 55 + contentHeight + childrenHeight + 18;
  }
}
