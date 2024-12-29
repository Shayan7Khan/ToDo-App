import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/tasks_model.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({
    super.key,
  });

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  List<Task> task = [];

  //function to add a task
  void addTask(String title, String time) {
    setState(() {
      task.add(Task(title: title, time: time));
    });
  }

  //function to delete a task
  void deleteTask(int index) {
    setState(() {
      task.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 100,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 25,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              DateFormat('MMMM d, y').format(
                DateTime.now(),
              ),
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                        itemCount: task.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: task[index].iscompleted
                                ? Icon(Icons.radio_button_unchecked)
                                : Icon(Icons.radio_button_checked),
                            title: Text('hello world'),
                            trailing: Text('time'),
                          );
                        }),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
