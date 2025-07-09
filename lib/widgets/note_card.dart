import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/notes_edit_view.dart';
import 'package:notes_app/views/read_note_view.dart';
import 'package:notes_app/widgets/confirmation_dialog_message.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.notes});

  final NotesModel notes;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Dismissible(
      key: Key(notes.key.toString()),
      background: Card(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.only(right: width / 2),
          child: Center(
            child: const Text(
              'Edit',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      secondaryBackground: Card(
        color: const Color.fromARGB(255, 188, 36, 25),
        child: Padding(
          padding: EdgeInsets.only(left: width / 2.3),
          child: Center(
            child: const Text(
              'Delete',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          // Swipe right to edit
          Navigator.push(
            context,
            MaterialPageRoute(
              barrierDismissible: true,
              builder: (context) {
                return NotesEditView(notes: notes);
              },
            ),
          );
          return false; // Don't dismiss the card for edit
        } else {
          // Swipe left to delete
          return await showDialog(
            context: context,
            builder: (context) {
              return ConfirmationMessageShowDialog(
                message: 'Are you sure you want to delete note?',
                onPressedYes: () {
                  notes.delete();
                  BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context, true);
                },
                onPressedNo: () {
                  Navigator.pop(context, false);
                },
              );
            },
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ReadNoteView(notes: notes,);
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
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      notes.subTitle,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    notes.noteDate,
                    style: const TextStyle(color: Colors.black38, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
