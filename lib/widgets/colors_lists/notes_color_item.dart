import 'package:flutter/material.dart';

class NoteColorItem extends StatelessWidget {
  const NoteColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 19,
              child: Icon(Icons.check, color: Colors.white),
            ),
          )
        : CircleAvatar(backgroundColor: color, radius: 22);
  }
}
