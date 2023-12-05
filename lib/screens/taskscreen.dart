// Screens/taskscreen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des tâches')),
      body: Consumer(
        builder: (context, watch, child) {
          final tasks = watch(taskProvider);
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task.title),
                trailing: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    final updatedTask = task.copyWith(isCompleted: value);
                    context.read(taskProvider.notifier).updateTask(updatedTask);
                  },
                ),
                onLongPress: () {
                  context.read(taskProvider.notifier).removeTask(task.id);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Affichez une boîte de dialogue pour ajouter une tâche
          // Créez une nouvelle tâche et envoyez-la au fournisseur
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
