import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/main.dart';
import 'package:utopia_recruitment_task/model/item/item.dart';
import 'package:utopia_recruitment_task/new_note.dart';
import 'package:utopia_recruitment_task/notes_list/notes_list.dart';
import 'dart:math' as math;

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() {
    return _NotesState();
  }
}

class _NotesState extends State<Notes> {
  final List<Note> _registeredNotes = [
    Note(
      date: DateTime.now(),
      title: 'Home renovation project',
      description: 'Project timeline: 4 months.\nStart: January',
      pinned: true,
    ),
    Note(
      date: DateTime.now(),
      title: 'Groceries',
      description: 'Eggs, Milk, Toilet Paper, Oranges',
      pinned: true,
    ),
    Note(
      date: DateTime.now(),
      title: 'Hello!',
      description: 'Handwritten note',
      pinned: true,
    ),
    Note(
      date: DateTime.now(),
      title: 'Idea for a song',
      description: 'rapapam rapapam',
      pinned: false,
    ),
    Note(
      date: DateTime.now(),
      title: 'Moms birthday',
      description: 'Second of june (I think??)',
      pinned: false,
    ),
    Note(
      date: DateTime.now(),
      title: 'Idea for a song',
      description: 'rapapam rapapam',
      pinned: false,
    ),
    Note(
      date: DateTime.now(),
      title: 'Moms birthday',
      description: 'Second of june (I think??)',
      pinned: false,
    ),
  ];

  void _openAddNoteOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewNote(onAddNote: _addNote),
    );
  }

  void _addNote(Note note) {
    setState(() {
      _registeredNotes.add(note);
    });
  }

  void _removeNote(Note note) {
    final noteIndex = _registeredNotes.indexOf(note);

    setState(() {
      _registeredNotes.remove(note);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Note deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredNotes.insert(noteIndex, note);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContentPinned = const Center(
      child: Text(
        'No notes found. Try adding some!',
      ),
    );
    Widget mainContent = const Center(
      child: Text(
        'No notes found. Try adding some!',
      ),
    );

    if (_registeredNotes.isNotEmpty) {
      mainContent = NotesList(
        notes: _registeredNotes,
        onRemoveNote: _removeNote,
      );
      mainContentPinned = NotesList(
        notes: _registeredNotes,
        onRemoveNote: _removeNote,
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 160, 108, 213),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              child: Icon(
                size: 25,
                Icons.screenshot,
              ),
              onPressed: () {
                print('...');
              },
              backgroundColor: Color.fromARGB(255, 16, 43, 63),
              foregroundColor: Color.fromARGB(255, 160, 108, 213),
            ),
            Spacer(),
            Text(
              _registeredNotes.length.toString() + ' notes',
            ),
            Spacer(),
            FloatingActionButton(
              child: Icon(size: 30, Icons.add),
              onPressed: () {
                _openAddNoteOverlay();
              },
              backgroundColor: Color.fromARGB(255, 16, 43, 63),
              foregroundColor: Color.fromARGB(255, 160, 108, 213),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 226, 207, 234),
      appBar: AppBar(
        // centerTitle: true,
        title: Text('Notes'),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  foregroundColor: Color.fromARGB(255, 160, 108, 213),
                  backgroundColor: Color.fromARGB(255, 16, 43, 63),
                  child: Icon(size: 25, Icons.person),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 0, right: 10),
                    margin: EdgeInsets.only(top: 10, left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                      // color: Color.fromARGB(255, 238, 108, 77),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Last 30 days',
                          style: TextStyle(
                            color: Color.fromARGB(255, 16, 43, 63),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 0, right: 0),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  // color: Color.fromARGB(255, 238, 108, 77),
                ),
                height: MediaQuery.of(context).size.height / 1.35,
                child: Scrollbar(
                  child: Expanded(
                    child: mainContent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
