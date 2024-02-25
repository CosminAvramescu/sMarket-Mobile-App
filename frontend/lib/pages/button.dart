import 'package:flutter/material.dart';
import 'package:frontend/pages/lastpage.dart';


class ChangingButton extends StatefulWidget {
  const ChangingButton({Key? key}) : super(key: key);

  @override
  _ChangingButtonState createState() => _ChangingButtonState();
}

class _ChangingButtonState extends State<ChangingButton> {
  bool isPressed = false;
  void _toggleButtonState() {
    setState(() {
      print(isPressed);
      isPressed = !isPressed;
      LastPageState.update();
      print(isPressed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isPressed)
          InkWell(
            onTap: _toggleButtonState,
            child: Container(
              width: 70,
              height: 40,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Got it',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        if (isPressed)
          Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
