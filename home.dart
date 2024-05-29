// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:read/notes.dart';
import 'package:read/to_do.dart'; 
class Note {
  final String title;
  final String body;

  Note({required this.title, required this.body});
}

List<Note> notes = [];

class Add extends StatefulWidget {

  final List<Note> notes;
  const Add({super.key, required this.notes});

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {

  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

   void _addNotes() {
    final String notesTitle = _titleController.text;
    final String note = _noteController.text;
    if (notesTitle.isNotEmpty || note.isNotEmpty) {
      setState(() {
        notes = [(Note(title: notesTitle, body: note))];
      });
    }
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NotesPad/To-Do List',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: notes.length, // Access notes list from widget
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(notes[index].title),
                        ),
                      );
                    },
                  ),
                ),
          ],
        ),
        backgroundColor: Colors.white30,
        floatingActionButton: PopupMenuButton(
          color: const Color.fromARGB(255, 236, 222, 171),
          onSelected: (choice) {
            if (choice == 'Add new notes') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const Addnotes(); // Replace with appropriate widget
                }),
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const Tolist(); // Replace with appropriate widget
                }),
              );
            }
          },
          icon: const FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: null,
            child:  Icon(
              Icons.add,
              color: Colors.amber,
            ),
          ),
          itemBuilder: (context) => [
            const PopupMenuItem<String>(
              value: 'Add new notes',
              child: ListTile(
                leading: Icon(Icons.notes),
                title: Text('Add new notes'),
              ),
            ),
            // Consider removing this option if handled by Addnotes
            const PopupMenuItem<String>(
              value: 'Add Todo list',
              child: ListTile(
                leading: Icon(Icons.notes),
                title: Text('Add Todo list'),
              ),
            ),
          ],
        ));
  }

  /*@override
  void didUpdateWidget(covariant Add oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.notes.length > oldWidget.notes.length) {
      setState(() {
        notes.addAll(
            widget.notes.where((note) => !oldWidget.notes.contains(note)));
      });
    }
  }*/
}