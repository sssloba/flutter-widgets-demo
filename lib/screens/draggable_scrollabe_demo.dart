import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class DraggableScrollableDemo extends StatelessWidget {
  const DraggableScrollableDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.deepPurple,
        ),
        const Material(
          color: Colors.deepPurple,
          child: SizedBox(
              height: 160,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Drag and Scroll Demo Button',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              )),
        ),
        Scaffold(
            drawer: const AppDrawer(),
            appBar: AppBar(title: const Text('Draggable Scrollable Demo')),
            backgroundColor: Colors.transparent,
            body: SizedBox.expand(
              child: DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  maxChildSize: 0.8,
                  minChildSize: 0.35,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        height: MediaQuery.of(context).size.height - 80,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.deepOrange,
                        child: Align(
                          alignment: const Alignment(0.0, -0.5),
                          child: ElevatedButton(
                            onPressed: () {},
                            child:
                                const Text('Draggable Scrollable Demo Button'),
                          ),
                        ),
                      ),
                    );
                  }),
            )),
      ],
    );
  }
}
