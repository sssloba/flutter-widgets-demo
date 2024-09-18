import 'package:flutter/material.dart';

class ResizableGestureContainer extends StatefulWidget {
  const ResizableGestureContainer({Key? key}) : super(key: key);

  @override
  State<ResizableGestureContainer> createState() =>
      _ResizableGestureContainerState();
}

class _ResizableGestureContainerState extends State<ResizableGestureContainer> {
  double leftPos = 33;
  double rightPos = 33;

  double transformX = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              transform: Matrix4.translationValues(transformX, 0, 0),
              height: 60,
              width: constraints.maxWidth,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: leftPos,
                    right: rightPos,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          onHorizontalDragUpdate: (details) {
                            leftPos = details.globalPosition.dx;
                            setState(() {});
                            debugPrint(leftPos.toString());
                          },
                          child: Container(
                            height: 60,
                            color: Colors.purple,
                            child: const Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            onHorizontalDragUpdate: (details) {
                              final midPos = details.delta;
                              transformX += midPos.dx;
                              setState(() {});
                              debugPrint(midPos.toString());
                            },
                            child: Container(
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          onHorizontalDragUpdate: (details) {
                            rightPos = constraints.maxWidth -
                                details.globalPosition.dx;
                            setState(() {});
                            debugPrint(rightPos.toString());
                          },
                          child: Container(
                            height: 60,
                            color: Colors.purple,
                            child: const Icon(
                              Icons.navigate_before_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
