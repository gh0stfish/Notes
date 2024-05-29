import 'package:flutter/material.dart';

class Task {
  final String title;
  bool isDone = false;

  Task({required this.title});
}

class Tolist extends StatefulWidget {
  const Tolist({super.key});

  @override
  State<Tolist> createState() => _TolistState();
}

class _TolistState extends State<Tolist> {
  final List<Task> task = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    final String taskTitle = _taskController.text;
    if (taskTitle.isNotEmpty) {
      setState(() {
        task.add(Task(title: taskTitle));
        _taskController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text(
          'Todo List',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      body: Column(
        children: [
          TextField(
            autocorrect: true,
            controller: _taskController,
            onSubmitted: (value) => _addTask(),
            decoration:
                const InputDecoration(hintText: 'What do you wish to do'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  activeColor: Colors.black,
                  checkColor: Colors.amber,
                  title: Text(
                    task[index].title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  value: task[index].isDone,
                  onChanged: (newValue) => setState(() {
                    task[index].isDone = newValue!;
                  }),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
