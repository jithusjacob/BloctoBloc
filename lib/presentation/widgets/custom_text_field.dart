import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  CustomTextField(this.hintText);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          errorText: hintText,
        ),
        onChanged: (text) {
          print(text);
        },
      ),
    );
  }
}
