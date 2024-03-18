import 'package:flutter/material.dart';
import '../../Models/task_model.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({required this.task});

  final TaskModel task;

  @override
  State<TaskWidget> createState() {
    // TODO: implement createState
    return _TaskWidgetState();
  }
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(width: 2, height: 2, color: priorityColor[widget.task.priority]),
              const SizedBox(
                width: 2,
              ),
              Text(
                widget.task.formattedDateTime,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          Text(widget.task.title),
          const SizedBox(
            height: 10,
          ),
          const LinearProgressIndicator(
            value: 1,
          )
        ],
      ),
    );
  }
}
