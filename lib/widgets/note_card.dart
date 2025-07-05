import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                'Flutter Tips',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Build your career with us in Flutter and Dart ',
                  style: TextStyle(color: Colors.black45, fontSize: 14),
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.trash,
                size: 22,
                color: Colors.black87,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                '05 July 2025',
                style: TextStyle(color: Colors.black38, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
