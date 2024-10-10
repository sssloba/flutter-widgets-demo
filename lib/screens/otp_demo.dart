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

class OtpField extends StatelessWidget {
  const OtpField({super.key, this.onSaved});

  final Function(String? pin)? onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: onSaved,
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
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
