import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class ShowLicencesDemo extends StatelessWidget {
  const ShowLicencesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Show Licences Demo'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                // application Icon, Name, Version and Legalese could be editable as in AboutListTile widget
                onPressed: () => showLicensePage(context: context),
                child: const Text(
                    'Click me to see Licenses through showLicensePage API')),
            const SizedBox(height: 30),
            const AboutListTile(
              icon: Icon(Icons.cabin_outlined),
              applicationIcon: Icon(
                Icons.cabin,
                color: Colors.red,
              ),
              applicationName: 'Licenses dialog - editable',
              applicationVersion: 'App version - editable',
              applicationLegalese: 'App legalese - editable',
              child: Center(
                child: ColoredBox(
                  color: Colors.green,
                  child: Text(
                    'Click me to see Licenses Dialog through AboutListTile widget',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
