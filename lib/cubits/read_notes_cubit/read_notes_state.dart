part of 'read_notes_cubit.dart';

@immutable
sealed class ReadNotesState {}

final class ReadNotesInitial extends ReadNotesState {}

final class ReadNotesLoading extends ReadNotesState {}

// final class ReadNotesSuccess extends ReadNotesState {
//   final List<NotesModel> notes;

//   ReadNotesSuccess(this.notes);
// }

// final class ReadNotesFailure extends ReadNotesState {
//   final String errorMessage;

//   ReadNotesFailure(this.errorMessage);
// }
