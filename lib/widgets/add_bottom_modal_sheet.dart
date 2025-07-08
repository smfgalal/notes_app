import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/bottom_sheet/notes_colors_list.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddBottomModalSheet extends StatelessWidget {
  const AddBottomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: BlocConsumer<AddNotesCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              debugPrint('Failed: ${state.errorMessage}');
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
              BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(child: AddBottomSheetForm()),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddBottomSheetForm extends StatefulWidget {
  const AddBottomSheetForm({super.key});

  @override
  State<AddBottomSheetForm> createState() => _AddBottomSheetFormState();
}

class _AddBottomSheetFormState extends State<AddBottomSheetForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: Column(
        children: [
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
            maxLines: 50,
            minLines: 8,
          ),
          const SizedBox(height: 32),
          const NoteColorsItemsList(),
          const SizedBox(height: 32),
          BlocBuilder<AddNotesCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate = DateFormat.yMMMMd()
                        .add_jm()
                        .format(currentDate);
                    var notesModel = NotesModel(
                      title: title!,
                      subTitle: subTitle!,
                      noteDate: formattedCurrentDate,
                      color: Colors.amber.toARGB32(),
                    );
                    BlocProvider.of<AddNotesCubit>(context).addNote(notesModel);
                  } else {
                    autoValidate = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                buttonText: 'Add Note',
                buttonBackgroundColor: kSecondaryColor,
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
