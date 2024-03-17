import 'package:flutter/material.dart';
import 'package:treak/Models/prompt_model.dart';
import 'package:treak/Models/section_model.dart';
import 'package:uuid/uuid.dart';
const uuid = Uuid();
class UserModel {
  UserModel({
    required this.name,
    required this.userType,
    required this.createdAt,
    required this.section,
    required this.prompt,
  }) : id = uuid.v4();
  final String id;
  final String name;
  final String userType;
  final DateTime createdAt;
  final List<SectionModel> section;
  final List<PromptModel> prompt;
}