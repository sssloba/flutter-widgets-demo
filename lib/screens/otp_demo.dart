import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_demo/widgets/app_drawer.dart';

class OtpDemo extends StatelessWidget {
  const OtpDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Demo'),
      ),
      drawer: const AppDrawer(),
      resizeToAvoidBottomInset: false,
      body: const Form(
          child: Padding(
        padding: EdgeInsets.only(top: 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OtpField(),
            OtpField(),
            OtpField(),
            OtpField(),
          ],
        ),
      )),
    );
  }
}

class OtpField extends StatefulWidget {
  const OtpField({super.key, this.onSaved});

  final Function(String? pin)? onSaved;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        controller: controller,
        autofocus: true,
        onChanged: (value) {
          if (value.isNotEmpty) {
            controller.text = value.substring(value.length - 1);

            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: widget.onSaved,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          //LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
