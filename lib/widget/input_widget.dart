import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final double height;
  final String topLabel;
  final bool obscureText;

  InputWidget({
    this.hintText,
    this.prefixIcon,
    this.height = 48.0,
    this.topLabel = "",
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(this.topLabel),
        SizedBox(height: 0.0),
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            obscureText: this.obscureText,
            decoration: InputDecoration(
              prefixIcon: this.prefixIcon == null
                  ? this.prefixIcon
                  : Icon(
                      this.prefixIcon,
                      color: Color.fromRGBO(105, 108, 121, 1),
                    ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(74, 77, 84, 0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFe3e3e3),
                ),
              ),
              hintText: this.hintText,
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(105, 108, 121, 0.7),
              ),
            ),
          ),
        )
      ],
    );
  }
}
