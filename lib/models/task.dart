// models/task.dart

import 'equatable';

class Task extends Equatable {
  final int id;
  final String title;
  final bool isCompleted;

  Task({required this.id, required this.title, this.isCompleted = false});

  @override
  List<Object?> get props => [id, title, isCompleted];
}
