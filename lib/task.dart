import 'package:flutter/material.dart';

class Task {
  String importance;
  String title;
  int id;
  bool checked = false;

  Task(
    this.importance,
    this.title,
    this.id,
    this.checked,
  );
}
