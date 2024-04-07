import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treak/Data/data.dart';
import 'package:treak/Models/task_model.dart';
import '../Models/section_model.dart';
import 'package:flutter/material.dart';

final sectionProvider =
    StateNotifierProvider<SectionNotifier, List<SectionModel>>(
        (ref) => SectionNotifier());

class SectionNotifier extends StateNotifier<List<SectionModel>> {
  SectionNotifier() : super(user.section);

  void addTask(SectionModel section, TaskModel task) {
    state[map[section]!].taskList = [...state[map[section]!].taskList, task];
  }

  void addSection(String sectionTitle,Icon unSelected, Icon selected) {
    SectionModel section = SectionModel(title: sectionTitle, taskList: [], icon: unSelected, selectedIcon: selected);
    map[section] = state.length;
    state = [...state, section];
  }
}
