import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat('jm');
const uuid = Uuid();

enum Priority { high, medium, low }

const Map<Priority, Color> priorityColor = {
  Priority.high: Color(0xffff6868),
  Priority.medium: Color(0xffe7bb41),
  Priority.low: Color(0xff87a922),
};

class TaskModel {
  TaskModel({
    required this.title,
    required this.dateTime,
    required this.priority,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final DateTime dateTime;
  Priority priority;

  String get formattedDateTime {
    return formatter.format(dateTime);
  }
}
