import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/notes_edit_view.dart';
import 'package:notes_app/widgets/confirmation_dialog_message.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.notes});

  final NotesModel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NotesEditView();
            },
          ),
        );
      },
      child: Card(
        color: Color(notes.color),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  notes.title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    notes.subTitle,
                    style: TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ConfirmationMessageShowDialog(
                          message: 'Are you sure you want to delete note?',
                          onPressedYes: () {
                            notes.delete();
                            Navigator.pop(context);
                            BlocProvider.of<ReadNotesCubit>(
                              context,
                            ).fetchAllNotes();
                          },
                          onPressedNo: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    size: 22,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  notes.noteDate,
                  style: TextStyle(color: Colors.black38, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
