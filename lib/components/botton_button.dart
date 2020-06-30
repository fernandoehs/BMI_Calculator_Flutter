import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class BottonButton extends StatelessWidget {

BottonButton({@required this.onTap, @required this.buttonTitle});

final Function onTap;
final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
            )
            ),
      
        color: kbottomContainerColour,
        margin: EdgeInsets.only(top:10.0),
        padding: EdgeInsets.only(bottom:20.0),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
