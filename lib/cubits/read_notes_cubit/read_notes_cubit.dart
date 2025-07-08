import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());

  List<NotesModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NotesModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(ReadNotesSuccess());
    // try {
    //   var notesBox = Hive.box<NotesModel>(kNotesBox);
    //   emit(ReadNotesSuccess(notesBox.values.toList()));
    // } catch (e) {
    //   emit(ReadNotesFailure(e.toString()));
    // }
  }
}
