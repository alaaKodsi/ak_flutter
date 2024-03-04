// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  String hintText;
  String labelText;
  IconData iconSuffix;
  MyTextFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.iconSuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: Icon(iconSuffix),
          suffixIconColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          label: Container(
            margin: const EdgeInsets.all(10),
            child: Text(labelText),
          ),
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
