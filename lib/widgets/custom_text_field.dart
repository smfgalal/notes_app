import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.onSaved,
  });

  final String hintText;
  final int maxLines;
  final int minLines;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required!';
        } else {
          return null;
        }
      },
      cursorColor: Colors.white54,
      cursorHeight: 25,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: const Color.fromARGB(255, 117, 117, 117)),

        border: customBorder(),
        enabledBorder: customBorder(),
        focusedBorder: customBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder customBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white60),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
