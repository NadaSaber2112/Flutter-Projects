// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:notes/constants.dart';
// import 'package:notes/models/note_model.dart';
// part 'notes_state.dart';

// class NotesCubit extends Cubit<NotesState> {
//   NotesCubit() : super(NoteInitial());

//   addNote(NoteModel note) async {
//     emit(NoteLoading());
//     try {
//       var noteBox = Hive.box<NoteModel>(kNotesBox);
      
//       await noteBox.add(note);
//       emit(NoteSuccess());
//     } catch (e) {
//      emit(NoteFailure( errMessage: e.toString()));
//     }
//   }

//   List<NoteModel>? notes;
//   fetchAllNotes() {
//     var noteBox = Hive.box<NoteModel>(kNotesBox);

//     notes = noteBox.values.toList();
//         print('+');

//     emit(AddNoteSuccess());
//   }

// }
