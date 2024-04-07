import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treak/Helpers/data_helper.dart';
import 'package:treak/Providers/date_provider.dart';
import 'package:treak/Widgets/Task-Widgets/task_widget.dart';
import '../../Models/task_model.dart';

class SectionWidget extends ConsumerStatefulWidget {
  const SectionWidget({super.key, required this.title, required this.taskList});

  final String title;
  final List<TaskModel> taskList;

  @override
  ConsumerState<SectionWidget> createState() {
    // TODO: implement createState
    return _SectionWidgetState();
  }
}

class _SectionWidgetState extends ConsumerState<SectionWidget> {
  late DateTime _selectedTime;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _selectedTime = ref.watch(dateProvider);
    var taskListAccDate = mapTaskToDate(widget.taskList, _selectedTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Wrap(
          spacing: 10,
          children: [
            for (final task in taskListAccDate)
              TaskWidget(
                task: task,
              )
          ],
        ),
      ],
    );
  }
}
