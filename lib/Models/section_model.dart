import 'package:flutter/cupertino.dart';
import 'package:treak/Models/task_model.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class SectionModel {
  SectionModel({
    required this.title,
    required this.taskList,
    required this.icon,
    required this.selectedIcon,
  }) : id = uuid.v4();
  final String id;
  final String title;
  List<TaskModel> taskList;
  final Icon icon;
  final Icon selectedIcon;
}
