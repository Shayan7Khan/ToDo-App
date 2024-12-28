import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/tasks.dart';

class TodoHomeScreen extends StatelessWidget {
  const TodoHomeScreen({super.key});

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
        toolbarHeight: 80,
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
            SizedBox(
              height: 16,
            ),
            Tasks()
          ],
        ),
      ),
    );
  }
}
