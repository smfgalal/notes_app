import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/widgets/add_bottom_modal_sheet.dart';
import 'package:notes_app/widgets/notes_home_view/notes_home_view_body.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class NotesHomeView extends StatefulWidget {
  const NotesHomeView({super.key});

  @override
  State<NotesHomeView> createState() => _NotesHomeViewState();
}

class _NotesHomeViewState extends State<NotesHomeView> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }
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
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: kSecondaryLightColor,
        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return asynchronous code
          return Future<void>.delayed(
            const Duration(seconds: 1),
            BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NotesHomeViewBody(),
        ),
      ),
    );
  }
}
