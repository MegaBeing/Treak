import 'package:treak/Data/data.dart';
import 'package:treak/Models/task_model.dart';
import '../Models/section_model.dart';
import 'package:flutter/material.dart';

void addTask(SectionModel section, TaskModel task) {
  section.taskList.add(task);
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
