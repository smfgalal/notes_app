import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        List<NotesModel> notes =
            BlocProvider.of<ReadNotesCubit>(context).notes ?? [];
        return notes.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ListView.builder(
                  itemCount: notes.length,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NoteCard(notes: notes[index]);
                  },
                ),
              )
            : Center(
                child: Text(
                  'There are no Notes to show!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
      },
    );
  }
}
