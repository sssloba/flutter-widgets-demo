import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class Steppers extends StatefulWidget {
  const Steppers({Key? key}) : super(key: key);

  @override
  _SteppersState createState() => _SteppersState();
}

class _SteppersState extends State<Steppers> {
  int currentStepIndex = 0;
  bool isVertical = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Steppers'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: isVertical ? Colors.green : Colors.red)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: (() => setState(() => isVertical = !isVertical)),
                child: Text(isVertical
                    ? 'Switch to horizontal stepper'
                    : 'Switch to vertical stepper'),
              ),
            ),
            Expanded(
              child: Stepper(
                type:
                    isVertical ? StepperType.vertical : StepperType.horizontal,
                currentStep: currentStepIndex,
                onStepTapped: (int stepIndex) =>
                    setState(() => currentStepIndex = stepIndex),
                controlsBuilder: isVertical
                    ? null // if null default CONTINUE and CANCEL buttons will appear
                    : (_, __) {
                        // set BuildContext and ContolsDetails as parameters if needed in custom widgets
                        //***EXAMPLE***/
                        //controlsBuilder: (BuildContext context, {VoidCallback? onStepContinue, VoidCallback? onStepCancel}){
                        //                    return Row(
                        //   children: <Widget>[
                        //     TextButton(
                        //       onPressed: onStepContinue,
                        //       child: const Text('NEXT'),
                        //     ),
                        //     TextButton(
                        //       onPressed: onStepCancel,
                        //       child: const Text('EXIT'),
                        //     ),
                        //   ],
                        // );
                        //}
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.0),
                          child: Text(
                            'You can set your custom widgets in controlsBuilder parameter inside of Stepper widget if you want to modifiy default CONTINUE and CANCEL buttons',
                            softWrap: true,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.cyan),
                          ),
                        );
                      },
                onStepContinue: () {
                  if (currentStepIndex < 2) {
                    setState(() => currentStepIndex++);
                  }
                },
                onStepCancel: () {
                  if (currentStepIndex > 0) {
                    setState(() => currentStepIndex--);
                  }
                },
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
          ],
        ),
      ),
    );
  }
}
