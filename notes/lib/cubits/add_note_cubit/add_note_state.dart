
//part of 'add_note_cubit.dart';

abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}
class AddNoteSuccess extends AddNoteState {}
class AddNoteFailure extends AddNoteState {
  final String errMessage;

  AddNoteFailure({required this.errMessage});

}
class NoteSuccess extends AddNoteState {}
