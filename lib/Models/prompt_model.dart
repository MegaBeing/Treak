import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
const uuid = Uuid();
class PromptModel {
  PromptModel({
    required this.prompt,
    required this.output,
  }) : id = uuid.v4();
  final String id;
  final String prompt;
  final String output;
}