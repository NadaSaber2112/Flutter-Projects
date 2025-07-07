import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';
import 'package:notes/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  String searchText = "";
  // List<NoteModel> allNotes = [];
  // List<NoteModel> filteredNotes = [];

  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<AddNoteCubit>(context);
    cubit.fetchAllNotes();
    // allNotes = cubit.notes ?? [];
    // filteredNotes = allNotes;
  }

  void onSearchTextChange(String text) {
    setState(() {
      searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        List<NoteModel> allNotes =
            BlocProvider.of<AddNoteCubit>(context).notes ?? [];
        List<NoteModel> filteredNotes =
            allNotes
                .where(
                  (note) =>
                      note.title.toLowerCase().contains(
                        searchText.toLowerCase(),
                      ) ||
                      note.subtitle.toLowerCase().contains(
                        searchText.toLowerCase(),
                      ),
                )
                .toList();
        

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const CustomAppBar(tital: 'Notes', icon: Icons.search),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  cursorColor: Colors.grey,
                  onChanged: onSearchTextChange,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search note...',
                    fillColor: Colors.grey.shade800,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(child: NotesListView(notes: filteredNotes)),
            ],
          ),
        );
      },
    );
  }
}

/*class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<AddNoteCubit>(context).fetchAllNotes();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(tital: 'Notes', icon: Icons.search),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                  hintText: 'Search note...',
                  fillColor: Colors.grey.shade800,
                  //filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  
                )
              ),
            ),
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}*/
