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
        child: Column(children: [const SizedBox(height: 40), EditNoteForm()]),
      ),
    );
  }
}

class EditNoteForm extends StatefulWidget {
  const EditNoteForm({super.key});

  @override
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          titleText: 'Edit Notes',
          buttonIcon: Icon(Icons.check, size: 26),
          isBackIcon: true,
          onPressed: () {
            
          },
        ),
        const SizedBox(height: 50),
        CustomTextField(
          onSaved: (value) {
            title = value;
          },
          hintText: 'Title',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          onSaved: (value) {
            subTitle = value;
          },
          hintText: 'Content',
          minLines: 15,
          maxLines: 50,
        ),
      ],
    );
  }
}
