import 'package:flutter/material.dart';
class CustomeTextFormFeild extends StatelessWidget {
  CustomeTextFormFeild({this.onChanged,this.hintText});
  String? hintText;
  Function(String)?onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return'field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(
              color: Color(0xff324A5E)
          )),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(
              color: Color(0xff324A5E)
          ))
      ),
    );
  }
}