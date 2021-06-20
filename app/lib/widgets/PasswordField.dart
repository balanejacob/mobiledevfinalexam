import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  final bool obscureText;
  final Function onTap;
  final Function validation;

   PasswordField( 
    {@required this.labelText,
    @required this.hintText,
    this.textEditingController,
    @required this.obscureText,
    @required this.onTap,
    @required this.validation}); 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      child:  TextFormField(
        style: TextStyle(color: Colors.tealAccent),
        validator: validation,
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),  
            child: Icon(Icons.lock,color: Colors.tealAccent,), 
          ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(obscureText ? Icons.visibility_off:Icons.visibility),
          ),
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          fillColor: Colors.black87, filled: true,
        ),
      ),
    );
  }
}