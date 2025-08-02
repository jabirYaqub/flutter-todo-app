// lib/screens/task_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:miniproject_todo_app/models/task.dart';
import 'package:miniproject_todo_app/providers/task_provider.dart';
import 'package:miniproject_todo_app/widgets/add_task_dialog.dart';

import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddTaskDialog(task: task),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              task.description.isNotEmpty
                  ? task.description
                  : 'No description provided.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Divider(height: 32),
            Row(
              children: [
                Icon(
                  task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: task.isCompleted ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  'Status: ${task.isCompleted ? 'Completed' : 'Incomplete'}',
                  style: TextStyle(
                    fontSize: 16,
                    color: task.isCompleted ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'Created: ${DateFormat('yyyy-MM-dd – hh:mm a').format(task.createdAt)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<TaskProvider>(context, listen: false).toggleTaskStatus(task);
          Navigator.of(context).pop();
        },
        child: Icon(task.isCompleted ? Icons.check : Icons.undo),
      ),
    );
  }
}