import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddBottomModalSheet extends StatelessWidget {
  const AddBottomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(hintText: 'Title'),
            const SizedBox(height: 16),
            CustomTextField(hintText: 'Content', maxLines: 50, minLines: 8),
            const SizedBox(height: 64),
            CustomButton(
              buttonText: 'Add Note',
              buttonBackgroundColor: kSecondaryColor,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
