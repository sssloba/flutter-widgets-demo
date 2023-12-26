import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class OverlayPortalDemo extends StatelessWidget {
  const OverlayPortalDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OverlayPortalController _overlayPortalController =
        OverlayPortalController();
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Overlay Portal Demo')),
      body: Center(
        child: ElevatedButton(
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
      ),
    );
  }
}
