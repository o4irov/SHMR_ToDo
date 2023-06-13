import 'package:flutter/material.dart';
import 'package:shmr_todo/constants/constants.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey<int>(task.id),
        child: Container(
          color: AppConstants.white(context),
          child: Row(
            children: [
              Checkbox(
                value: task.status == 'done',
                onChanged: (value) {},
                checkColor: AppConstants.green(context),
                fillColor: task.importance == 'high'
                    ? MaterialStateProperty.all<Color>(
                        AppConstants.red(context))
                    : MaterialStateProperty.all<Color>(
                        AppConstants.separator(context)),
              ),
              Text(
                task.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline,
                  color: AppConstants.tertiary(context),
                ),
              ),
            ],
          ),
        ));
  }
}
