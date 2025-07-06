import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NotesEditView extends StatelessWidget {
  const NotesEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomAppBar(
              titleText: 'Edit Notes',
              buttonIcon: Icon(Icons.check, size: 26),
              isBackIcon: true,
            ),
            const SizedBox(height: 50),
            CustomTextField(hintText: 'Title'),
            const SizedBox(height: 16),
            CustomTextField(hintText: 'Content', minLines: 15, maxLines: 50),
          ],
        ),
      ),
    );
  }
}
