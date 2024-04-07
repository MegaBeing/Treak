import 'package:treak/Models/prompt_model.dart';
import 'package:treak/Models/section_model.dart';
import 'package:treak/Models/task_model.dart';
import 'package:flutter/material.dart';
import '../Models/user_model.dart';

DateTime now = DateTime.now();
SectionModel collegeSection = SectionModel(
  title: "College",
  taskList: [
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
  ],
  icon: Icon(Icons.account_balance_outlined),
  selectedIcon: const Icon(Icons.account_balance),
);
SectionModel schoolSection = SectionModel(
  title: "School",
  taskList: [
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
    TaskModel(
      title: "Rest is the best thing in the world",
      dateTime: DateTime(now.year, now.month, now.day, 12),
      priority: Priority.high,
    ),
  ],
  icon: const Icon(Icons.account_balance_outlined),
  selectedIcon: const Icon(Icons.account_balance),
);
UserModel user = UserModel(
  name: "Sahil Jain",
  userType: "Student",
  createdAt: now,
  section: [
    collegeSection,
    schoolSection,
  ],
  prompt: [
    PromptModel(
      prompt: "This is a question?",
      output: "This is the answer given by ChatGpt",
    ),
  ],
);
Map<SectionModel,int>map = {collegeSection: 0,
schoolSection: 1};
