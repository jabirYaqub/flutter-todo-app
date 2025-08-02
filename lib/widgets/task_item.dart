// lib/widgets/task_item.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miniproject_todo_app/models/task.dart';
import 'package:miniproject_todo_app/providers/task_provider.dart';
import 'package:miniproject_todo_app/screens/task_detail_screen.dart';
import 'package:miniproject_todo_app/widgets/add_task_dialog.dart'; // Import the add/edit dialog
import 'package:miniproject_todo_app/widgets/delete_confirmation_dialog.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TaskDetailScreen(task: task),
            ),
          );
        },
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            taskProvider.toggleTaskStatus(task);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted ? Colors.grey : null,
          ),
        ),
        trailing: Row( // Use a Row to place multiple icons
          mainAxisSize: MainAxisSize.min, // Prevents the row from taking up all available space
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue), // Edit icon
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddTaskDialog(task: task), // Pass the existing task to the dialog
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red), // Delete icon
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => DeleteConfirmationDialog(
                    onConfirm: () {
                      taskProvider.deleteTask(task.id!);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}