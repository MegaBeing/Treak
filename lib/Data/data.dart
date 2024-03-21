import 'package:treak/Models/prompt_model.dart';
import 'package:treak/Models/section_model.dart';
import 'package:treak/Models/task_model.dart';

import '../Models/user_model.dart';
DateTime now = DateTime.now();
UserModel user = UserModel(
  name: "Sahil Jain",
  userType: "Student",
  createdAt: now,
  section: [
    SectionModel(
      title: "College",
      taskList: [
        TaskModel(
          title: "Rest is the best thing in the world",
          dateTime: DateTime(now.year, now.month, now.day,12),
          priority: Priority.high,
        ),
      ],
    ),
  ],
  prompt: [
    PromptModel(
      prompt: "This is a question?",
      output: "This is the answer given by ChatGpt",
    ),
  ],
);
