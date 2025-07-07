import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes/models/note_model.dart';

//part of 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  List<NoteModel>? notes;
   addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
     emit(AddNoteFailure( errMessage: e.toString()));
    }
  }
  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);

    notes = noteBox.values.toList();
        print('fetchhhhhhh ${notes?.length}');

    emit(NoteSuccess());
  }

  /*void addNote(NoteModel note) async {
  var noteBox = Hive.box<NoteModel>(kNotesBox);
  await noteBox.add(note);         // Save note
  fetchAllNotes();                 // Update local notes list
}*/
}
