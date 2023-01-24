import 'package:flutter/material.dart';

class CustomTextFieldWithDropdown extends StatelessWidget {
  final key1 = GlobalKey<State<Tooltip>>();
  CustomTextFieldWithDropdown({
    this.label,
    this.controller,
    this.title,
    this.suffix,
    this.hintText,
    this.onChanged,
    this.borderColor = Colors.black,
  });

  final String? label;
  final TextEditingController? controller;
  final String? title;
  final Widget? suffix;
  final String? hintText;
  final Color borderColor;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.digitsOnly
      // ],
      onChanged: onChanged,
      controller: controller,
      cursorColor: Color(0xFF90A4AE),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffix,
        constraints: BoxConstraints(maxHeight: 40),
        contentPadding: EdgeInsets.only(left: 0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: .5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: .5),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: .5),
        ),
        focusColor: Colors.red,
        labelStyle: TextStyle(color: Color(0xFF424242)),
        labelText: label,
      ),
    );
  }
}
