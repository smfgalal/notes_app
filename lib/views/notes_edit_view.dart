import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/colors_lists/edit_notes_colors_list.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NotesEditView extends StatelessWidget {
  const NotesEditView({super.key, required this.notes});

  final NotesModel notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            EditNoteForm(notes: notes),
          ],
        ),
      ),
    );
  }
}

class EditNoteForm extends StatefulWidget {
  const EditNoteForm({super.key, required this.notes});
  final NotesModel notes;

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
            widget.notes.title = title ?? widget.notes.title;
            widget.notes.subTitle = subTitle ?? widget.notes.subTitle;
            widget.notes.save();
            BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 50),
        CustomTextField(
          initialValue: widget.notes.title,
          onChanged: (value) {
            title = value;
          },
          hintText: 'Title',
        ),
        const SizedBox(height: 16),

        CustomTextField(
          initialValue: widget.notes.subTitle,
          onChanged: (value) {
            subTitle = value;
          },
          hintText: 'Content',
          minLines: 15,
          maxLines: 50,
        ),
        const SizedBox(height: 16),
        EditNotesColorsList(notes: widget.notes),
      ],
    );
  }
}

