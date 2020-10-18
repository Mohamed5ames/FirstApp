import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  HeaderButton({
    this.onPress,
    this.buttonColor,
    this.buttonText,
    this.labelColor,
  });
  final Color buttonColor;
  final String buttonText;
  final Color labelColor;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width / 3;
    return Container(
      width: containerWidth,
      child: FlatButton(
        minWidth: containerWidth,
        onPressed: onPress,
        shape: StadiumBorder(),
        color: buttonColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: containerWidth / 10,
              color: labelColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'Segoue',
            ),
          ),
        ),
      ),
    );
  }
}
