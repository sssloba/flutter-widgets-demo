import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class Steppers extends StatefulWidget {
  const Steppers({Key? key}) : super(key: key);

  @override
  _SteppersState createState() => _SteppersState();
}

class _SteppersState extends State<Steppers> {
  int currentStepIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Steppers'),
      ),
      body: Center(
        child: Stepper(
          currentStep: currentStepIndex,
          onStepTapped: (int stepIndex) =>
              setState(() => currentStepIndex = stepIndex),
          steps: <Step>[
            const Step(
              isActive: true,
              title: Text('Start'),
              content: Text('This is the first step'),
            ),
            Step(
              isActive: currentStepIndex >= 1,
              title: const Text('Middle'),
              content: const Text('This is the second step'),
            ),
            Step(
              isActive: currentStepIndex == 2,
              title: const Text('End'),
              content: const Text('This is the last step'),
            ),
          ],
        ),
      ),
    );
  }
}
