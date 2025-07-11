import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/notes_home_view/notes_home_view_list.dart';

class NotesHomeViewBody extends StatefulWidget {
  const NotesHomeViewBody({super.key});

  @override
  State<NotesHomeViewBody> createState() => _NotesHomeViewBodyState();
}

class _NotesHomeViewBodyState extends State<NotesHomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        CustomAppBar(
          titleText: 'Notes',
          buttonIcon: Icon(Icons.search, size: 26),
          isBackIcon: false,
          onPressed: () {
            
          },
        ),
        const Expanded(child: NotesListView()),
      ],
    );
  }
}
