import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const ListTile(
              leading: Icon(Icons.radio_button_unchecked), // button
              title: Text('hello world'), // task
              trailing: Text('time'),
            ),
          ),
        ),
      ],
    );
  }
}
