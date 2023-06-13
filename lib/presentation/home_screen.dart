import 'package:flutter/material.dart';
import 'package:shmr_todo/constants/constants.dart';
import 'package:shmr_todo/presentation/todo_list.dart';
import 'package:shmr_todo/utils/localizations.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool _isVisible = false;
  int count = 0;
  void _increaseCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(50, 90, 20, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)?.translate('tasks') ?? '',
                  style: theme.textTheme.titleLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)?.translate('done')} - $count',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppConstants.tertiary(context),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: Icon(
                        _isVisible
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        color: AppConstants.blue(context),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppConstants.backSecondary(context),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ToDoList(
              increaseCount: _increaseCount,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppConstants.blue(context),
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: AppConstants.white(context),
        ),
      ),
    );
  }
}
