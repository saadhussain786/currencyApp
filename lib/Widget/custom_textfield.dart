import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  bool isHide;
  String label;
  String hintText;
  IconData icon;
  CustomTextField(
      {required this.controller,
      required this.label,
      required this.icon,
      required this.isHide,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHide,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text('$label'),
        hintText: "$hintText",
        prefixIcon: Icon(icon)
      ),
    );
  }
}