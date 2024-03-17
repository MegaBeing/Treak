import 'package:treak/Models/prompt_model.dart';
import 'package:treak/Models/section_model.dart';
import 'package:treak/Models/task_model.dart';

import '../Models/user_model.dart';

UserModel user = UserModel(
  name: "Sahil Jain",
  userType: "Student",
  createdAt: DateTime.now(),
  section: [
    SectionModel(
      title: "College",
      taskList: [
        TaskModel(
          title: "Rest",
          dateTime: DateTime.now(),
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
