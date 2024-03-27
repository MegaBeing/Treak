import 'package:flutter/material.dart';
import 'package:treak/Widgets/Task-Widgets/task_widget.dart';
import '../../Models/task_model.dart';

class SectionWidget extends StatefulWidget {
  SectionWidget({required this.title, required this.taskList});

  final String title;
  final List<TaskModel> taskList;

  @override
  State<SectionWidget> createState() {
    // TODO: implement createState
    return _SectionWidgetState();
  }
}

class _SectionWidgetState extends State<SectionWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Wrap(
          spacing: 10,
          children: [
            for (final task in widget.taskList)
              TaskWidget(
                task: task,
              )
          ],
        ),
      ],
    );
  }
}
