import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';

import 'package:notes/views/widgets/custom_note_item.dart';




class NotesListView extends StatelessWidget {
  final List<NoteModel> notes;

  const NotesListView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        itemCount: notes.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: NoteItem(note: notes[index]),
          );
        },
      ),
    );
  }
}











/*class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<AddNoteCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: NoteItem(note: notes[index]),
              );
            },
          ),
        );
      },
    );
  }
}

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  List<NoteModel> notes = [];
  List<NoteModel> filteredNotes = [];
  @override
  void initState() {
    BlocProvider.of<AddNoteCubit>(context).fetchAllNotes();
    super.initState();
    notes = cubit.notes ?? [];
    filteredNotes = notes;
  }



void onSearchTextChange(String searchText) {
    filteredNotes =
        notes
            .where(
              (note) =>
                  note.title.toLowerCase().contains(searchText.toLowerCase()) ||
                  note.subtitle.toLowerCase().contains(
                    searchText.toLowerCase(),
                  ),
            )
            .toList();
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
              onChanged: onSearchTextChange,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Search note...',
                fillColor: Colors.grey.shade800,
                //filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}*/
