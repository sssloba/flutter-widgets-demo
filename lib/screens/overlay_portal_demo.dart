import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class OverlayPortalDemo extends StatelessWidget {
  const OverlayPortalDemo({Key? key}) : super(key: key);

  void showRandomOverlays(OverlayPortalController controller) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timer.tick <= 12 ? controller.toggle() : timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final OverlayPortalController _overlayPortalController =
        OverlayPortalController();
    final OverlayPortalController _overlayPortalRandomController =
        OverlayPortalController();

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Overlay Portal Demo')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _overlayPortalController.toggle,
              child: OverlayPortal(
                controller: _overlayPortalController,
                overlayChildBuilder: (BuildContext context) {
                  return const Positioned(
                    top: 400,
                    right: 50,
                    child: ColoredBox(
                      color: Colors.cyanAccent,
                      child: SizedBox(
                        height: 150,
                        width: 200,
                        child: Center(
                          child: Text(
                            'I am an Overlay!!!',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Press me to see an overlay!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  showRandomOverlays(_overlayPortalRandomController),
              child: OverlayPortal(
                controller: _overlayPortalRandomController,
                overlayChildBuilder: (BuildContext context) {
                  return Positioned(
                    top: 10 + Random().nextDouble() * 300,
                    right: 10 + Random().nextDouble() * 200,
                    child: ColoredBox(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      child: SizedBox(
                        height: 100 + Random().nextDouble() * 200,
                        width: 100 + Random().nextDouble() * 100,
                        child: const Center(
                          child: Text(
                            'I am an Rundom Overlay!!!',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Press me to see Rundom overlay!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
