// providers/task_provider.dart

import 'package';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod/riverpod.dart';

import '../models/task.dart';
import 'models';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void addTask(Task task) {
    state = [...state, task];
  }

  void updateTask(Task updatedTask) {
    state = state.map((task) => task.id == updatedTask.id ? updatedTask : task).toList();
  }

  void removeTask(int taskId) {
    state = state.where((task) => task.id != taskId).toList();
  }
}
