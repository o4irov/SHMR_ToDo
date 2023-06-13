import 'package:flutter/material.dart';
import 'package:shmr_todo/models/task.dart';
import 'package:shmr_todo/presentation/task.dart';

class ToDoList extends StatefulWidget {
  final Function() increaseCount;
  const ToDoList({super.key, required this.increaseCount});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> tasks = [
    Task(id: 1, title: 'Купить что-то', description: ''),
    Task(id: 2, title: 'Купить что-то', description: ''),
    Task(id: 3, title: 'Купить что-то', description: ''),
  ];
  void _callCountChanged() {
    widget.increaseCount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          TaskTile(task: tasks[index]);
        },
      ),
    );
  }
}
