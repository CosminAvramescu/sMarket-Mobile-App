import 'package:flutter/material.dart';

class ChangingButton2 extends StatefulWidget {
  const ChangingButton2({Key? key}) : super(key: key);

  @override
  _ChangingButtonState2 createState() => _ChangingButtonState2();
}

class _ChangingButtonState2 extends State<ChangingButton2> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isButtonPressed = !isButtonPressed;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: isButtonPressed ? Colors.green : Colors.blue,
      ),
      child: Text('Press me'),
    );
  }
}
