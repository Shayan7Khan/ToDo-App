import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/widgets/adding_task.dart';
import 'package:todo_app/models/tasks_model.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  final List<Task> task = [];

  // Adding the task to the list
  void addTask(String title, DateTime time) {
    setState(() {
      task.insert(
        0,
        Task(
          title: title,
          time: DateTime.now(),
        ),
      );
    });
  }

  // Deleting the task from the list
  void deleteTask(int index) {
    setState(() {
      task.removeAt(index);
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
              const SizedBox(height: 8),
              Text(
                DateFormat('MMMM d, y').format(DateTime.now()),
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: task.isEmpty
                    ? const Center(
                        child: Text(
                          'No Tasks Added Yet!',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: task.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: IconButton(
                                onPressed: () {
                                  setState(() {
                                    task[index].iscompleted =
                                        !task[index].iscompleted;
                                  });
                                },
                                icon: task[index].iscompleted
                                    ? const Icon(Icons.radio_button_checked)
                                    : const Icon(Icons.radio_button_unchecked),
                              ),
                              title: Text(
                                task[index].title,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: task[index].iscompleted
                                      ? Colors.grey
                                      : Colors.white,
                                  decoration: task[index].iscompleted
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    DateFormat('hh:mm a')
                                        .format(task[index].time),
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      deleteTask(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
        floatingActionButton: AddingTask(addTask: addTask));
  }
}
