import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/add_bottom_modal_sheet.dart';
import 'package:notes_app/widgets/notes_home_view/notes_home_view_body.dart';

class NotesHomeView extends StatelessWidget {
  const NotesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondaryColor,
        foregroundColor: Colors.white,
        splashColor: kPrimaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddBottomModalSheet();
            },
          );
        },
        child: const Icon(Icons.add, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NotesHomeViewBody(),
      ),
    );
  }
}



