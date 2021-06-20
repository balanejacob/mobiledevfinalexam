import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Function validation; 

  CustomTextFormField(
    {@required this.labelText,
    @required this.hintText,
    @required this.iconData,
    @required this.textEditingController,
    @required this.textInputType,
    @required this.validation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      child: TextFormField(
      style: TextStyle(color: Colors.tealAccent),
      controller: textEditingController,
      keyboardType: textInputType,
      validator: validation,
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(iconData,color: Colors.tealAccent,), 
        ),
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        fillColor: Colors.black87, filled: true,
      ),
    ));
  }
}