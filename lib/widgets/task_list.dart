// lib/widgets/task_list.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miniproject_todo_app/providers/task_provider.dart';
import 'package:miniproject_todo_app/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final bool isCompletedTab;
  const TaskList({super.key, required this.isCompletedTab});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        final tasks = isCompletedTab
            ? taskProvider.completedTasks
            : taskProvider.incompleteTasks;

        if (tasks.isEmpty) {
          return Center(
            child: Text(
              isCompletedTab ? 'No completed tasks.' : 'No incomplete tasks.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskItem(task: tasks[index]);
          },
        );
      },
    );
  }
}