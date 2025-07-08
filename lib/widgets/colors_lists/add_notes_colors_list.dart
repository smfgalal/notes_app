import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/colors_lists/notes_color_item.dart';

class NoteColorsItemsList extends StatefulWidget {
  const NoteColorsItemsList({super.key});

  @override
  State<NoteColorsItemsList> createState() => _NoteColorsItemsListState();
}

class _NoteColorsItemsListState extends State<NoteColorsItemsList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kNotesColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNotesCubit>(context).color =
                    kNotesColors[index];
                setState(() {});
              },
              child: NoteColorItem(
                color: kNotesColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}


