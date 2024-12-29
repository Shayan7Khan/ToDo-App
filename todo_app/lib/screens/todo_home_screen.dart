import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/tasks_model.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  List<Task> task = [];

  //adding the task to the list
  void addTask(String title, DateTime time) {
    setState(() {
      task.add(
        Task(title: title, time: DateTime.now()),
      );
    });
  }

  //deleting the task from the list.
  void deleteTask(index) {
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
            Column(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: task.isEmpty
                        ? const Text('No Tasks Added Yet !')
                        : ListView.builder(
                            itemCount: task.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      task[index].iscompleted =
                                          !task[index].iscompleted;
                                    });
                                  },
                                  icon: task[index].iscompleted
                                      ? const Icon(Icons.radio_button_checked)
                                      : const Icon(
                                          Icons.radio_button_unchecked),
                                ),
                                title: Text(
                                  task[index].title,
                                  style: TextStyle(
                                      decoration: task[index].iscompleted
                                          ? TextDecoration.lineThrough
                                          : null),
                                ),
                                trailing: Row(
                                  children: [
                                    Text(
                                      DateFormat('hh:mm a')
                                          .format(task[index].time),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          deleteTask(index);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
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
