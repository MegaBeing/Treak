import 'package:treak/Models/task_model.dart';
import 'package:uuid/uuid.dart';
const uuid = Uuid();

class SectionModel {
  SectionModel({
    required this.title,
    required this.taskList,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final List<TaskModel> taskList;
}

