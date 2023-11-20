import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/model/item/item.dart';

class NewNote extends StatefulWidget {
  const NewNote({
    super.key,
    required this.onAddNote,
  });

  final void Function(Note note) onAddNote;

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _submitNoteData() {
    widget.onAddNote(
      Note(
        title: _titleController.text,
        description: _noteController.text,
        date: DateTime.now(),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 207, 234),
        bottomNavigationBar: BottomAppBar(
          height: 60,
          color: Color.fromARGB(255, 160, 108, 213),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                mini: true,
                child: Icon(
                  size: 25,
                  Icons.photo_camera,
                ),
                onPressed: () {},
                backgroundColor: Color.fromARGB(255, 16, 43, 63),
                foregroundColor: Color.fromARGB(255, 160, 108, 213),
              ),
              Spacer(),
              FloatingActionButton(
                mini: true,
                child: Icon(size: 25, Icons.font_download),
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Color.fromARGB(255, 16, 43, 63),
                foregroundColor: Color.fromARGB(255, 160, 108, 213),
              ),
              Spacer(),
              FloatingActionButton(
                mini: true,
                child: Icon(size: 25, Icons.checklist_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Color.fromARGB(255, 16, 43, 63),
                foregroundColor: Color.fromARGB(255, 160, 108, 213),
              ),
              Spacer(),
              FloatingActionButton(
                mini: true,
                child: Icon(size: 30, Icons.share),
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Color.fromARGB(255, 16, 43, 63),
                foregroundColor: Color.fromARGB(255, 160, 108, 213),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              _titleController.text != ''
                  ? showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Warning'),
                        content: const Text(
                          'Would you like to save your note?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _submitNoteData();
                              Navigator.pop(ctx);
                            },
                            child: const Text('Yes please'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            child: const Text('Noo'),
                          ),
                        ],
                      ),
                    )
                  : Navigator.pop(ctx);
            },
          ),
          actions: [
            SizedBox(
              width: 50,
            ),
            Text('Go back'),
            Spacer(),
            IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.live_help),
            ),
            TextButton(
              onPressed: () {
                _titleController.text != '' && _noteController.text != ''
                    ? _submitNoteData()
                    : {
                        ScaffoldMessenger.of(context).clearSnackBars(),
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: const Text('No title'),
                            action: SnackBarAction(
                              label: 'Save anyway',
                              onPressed: () {
                                setState(() {
                                  _submitNoteData();
                                });
                              },
                            ),
                          ),
                        ),
                      };
                if (_noteController.text == '') {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 3),
                      content: const Text('This note is empty'),
                      action: SnackBarAction(
                        label: 'Save anyway',
                        onPressed: () {
                          setState(() {
                            _submitNoteData();
                          });
                        },
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                16,
                keyboardSpace + 16,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: _titleController,
                      maxLines: 1,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        hintText: 'Title',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: TextField(
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: _noteController,
                      maxLength: 1000,
                      decoration: const InputDecoration(
                        hintText: 'Note goes here (:',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
