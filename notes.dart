import 'package:flutter/material.dart';
import 'package:read/home.dart';

class Addnotes extends StatefulWidget {
  const Addnotes({super.key});

  @override
  State<Addnotes> createState() => _AddnotesState();
}

class _AddnotesState extends State<Addnotes> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  //final List<Note> notes = [];

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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text(
          'Note',
          style: TextStyle(color: Colors.amber),
        ),
        actions: [
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            onPressed: () {
              _addNotes();
              Navigator.pop(context, _addNotes);
            },
            child: const Icon(
              Icons.save,
              color: Colors.amberAccent,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
              controller: _titleController,
              decoration: const InputDecoration(
                  fillColor: Colors.black26,
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 35, color: Colors.black26)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: TextField(
                style: const TextStyle(fontSize: 18, color: Colors.black),
                maxLines: 9999999999999999,
                autocorrect: true,
                controller: _noteController,
                decoration: const InputDecoration(
                  fillColor: Colors.black26,
                  border: InputBorder.none,
                  hintText: 'Note',
                  hintStyle: TextStyle(fontSize: 25, color: Colors.black26),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.all(Radius.zero)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              child: const Icon(
                Icons.image,
                size: 35,
                color: Colors.amber,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              child: const Icon(
                Icons.mic,
                size: 35,
                color: Colors.amber,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              child: const Icon(
                Icons.document_scanner,
                size: 35,
                color: Colors.amber,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              child: const Icon(
                Icons.check_box,
                size: 35,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
