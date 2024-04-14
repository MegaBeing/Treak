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
  icon: const Icon(Icons.account_balance_outlined),
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
Map<SectionModel, int> map = {
  collegeSection: 0,
  schoolSection: 1,
};
Map<String, IconData> textToIconMap = {
  "School": Icons.account_balance_outlined,
  "Wallet": Icons.account_balance_wallet_outlined,
  "Printer": Icons.adf_scanner_outlined,
  "Agriculture": Icons.agriculture_outlined,
  "Sleep": Icons.airline_seat_flat_outlined,
  "Flight": Icons.airplane_ticket_outlined,
};
Map<IconData, IconData> sectionIconOnSelectMap = {
  Icons.account_balance_outlined: Icons.account_balance,
  Icons.account_balance_wallet_outlined: Icons.account_balance_wallet,
  Icons.adf_scanner_outlined: Icons.adf_scanner,
  Icons.agriculture_outlined: Icons.agriculture,
  Icons.airline_seat_flat_outlined: Icons.airline_seat_flat,
  Icons.airplane_ticket_outlined: Icons.airplane_ticket,
};
