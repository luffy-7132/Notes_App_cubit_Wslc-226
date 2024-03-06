import 'package:flutter/material.dart';

///required this.    this.

class CustomWidgets {
  static customTextField(
      {String? text = "Title",
      IconData? icon = Icons.edit,
      TextEditingController? controller}) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: text,
            prefixIcon: Icon(icon)),
      ),
    );
  }

  static customElevatedButton(String text, void Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(minimumSize: Size(300, 50)),
    );
  }
}
