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
    DateTime now = DateTime.now();
    final double progress =
        widget.task.dateTime.difference(now).inMilliseconds.toDouble() /
            DateTime(now.year, now.month, now.day)
                .difference(widget.task.dateTime)
                .inMilliseconds
                .toDouble();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxWidth: 325, maxHeight: 300),
          decoration: BoxDecoration(
            color: const Color(0xff393838),
            borderRadius: BorderRadius.circular(29),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: priorityColor[widget.task.priority],
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.task.formattedDateTime,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                widget.task.title,
                style: const TextStyle(color: Colors.grey, fontSize: 28),
              ),
              const Spacer(),
              LinearProgressIndicator(
                color: priorityColor[widget.task.priority],
                value: progress,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
