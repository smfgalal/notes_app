import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class NoteColorsItemsList extends StatefulWidget {
  const NoteColorsItemsList({super.key});

  @override
  State<NoteColorsItemsList> createState() => _NoteColorsItemsListState();
}

class _NoteColorsItemsListState extends State<NoteColorsItemsList> {
  int currentIndex = 0;
  List<Color> colors = const [
    Colors.amber,
    Color(0xffBAC1B8),
    Color(0xff0C7C59),
    Colors.blue,
    Color(0xff58A4B0),
    Color(0xff3626A7),
    Colors.deepOrange,
    Color(0xffB5CA8D),
    Colors.pink,
    Color(0xff465362),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNotesCubit>(context).color = colors[index];
                setState(() {});
              },
              child: NoteColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}

class NoteColorItem extends StatelessWidget {
  const NoteColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 19,
              child: Icon(Icons.check, color: Colors.white),
            ),
          )
        : CircleAvatar(backgroundColor: color, radius: 22);
  }
}
