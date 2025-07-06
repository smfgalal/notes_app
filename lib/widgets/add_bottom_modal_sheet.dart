import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
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
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ? true : false,
              child: SingleChildScrollView(child: AddBottomSheetForm()),
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
          const SizedBox(height: 64),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var notesModel = NotesModel(
                  title: title!,
                  subTitle: subTitle!,
                  noteDate: DateTime.now().toString(),
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
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
