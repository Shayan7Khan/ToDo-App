import 'package:flutter/material.dart';

class AddingTask extends StatelessWidget {
  final Function(String title, DateTime time) addTask;
  const AddingTask({super.key, required this.addTask});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return FloatingActionButton(
      onPressed: () {
        controller.text = '';
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Add Task',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
              content: TextField(
                controller: controller,
                decoration: InputDecoration(
                    labelText: 'Enter The Task',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      addTask(
                        controller.text,
                        DateTime.now(),
                      );

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
