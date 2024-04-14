import 'package:treak/Data/data.dart';
import 'package:treak/Models/task_model.dart';
import 'package:treak/Widgets/AddData/add_group_widget.dart';
import '../Models/section_model.dart';
import 'package:flutter/material.dart';

void addTask(SectionModel section, TaskModel task) {
  section.taskList.add(task);
}
void removeTask(SectionModel section, TaskModel task) {
  section.taskList.remove(task);
}
void addSection(String sectionTitle, Icon unSelected, Icon selected) {
  SectionModel section = SectionModel(
    title: sectionTitle,
    taskList: [],
    icon: unSelected,
    selectedIcon: selected,
  );
  user.section.add(section);
}

List<TaskModel> mapTaskToDate(List<TaskModel> taskList, DateTime dateTime) {
  return taskList
      .where((element) => (element.dateTime.day == dateTime.day))
      .toList();
}
