import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treak/Models/task_model.dart';
import 'package:treak/Providers/section_provider.dart';

import '../Data/data.dart';
import '../Models/section_model.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key, required this.height});

  final double height;

  @override
  ConsumerState<AddTaskScreen> createState() {
    // TODO: implement createState
    return _AddTaskScreenState();
  }
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _value;
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;
  Priority _priority = Priority.low;
  late List<SectionModel> _sections;
  SectionModel _section = user.section[0];

  void _save() {
    if (_selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) =>
            AlertDialog(
              title: const Text('No Date Selected'),
              content: const Text(
                  'Please select The date of the following task'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('Okay'),
                ),
              ],
            ),
      );
      return;
    }
    if (_selectedTime == null) {
      showDialog(
        context: context,
        builder: (ctx) =>
            AlertDialog(
              title: const Text('No Time Selected'),
              content: const Text('Please select time of the following task'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('Okay'),
                ),
              ],
            ),
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var task = TaskModel(title: _value!,
        dateTime: DateTime(
            _selectedDate!.year, _selectedDate!.month, _selectedDate!.day,
            _selectedTime!.hour, _selectedTime!.minute),
        priority: _priority,);
      _section.taskList.add(task);
    }
  }

  void _timePicker() async {
    final time =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      _selectedTime = time!;
    });
  }

  void _datePicker() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime
            .now()
            .year + 1));
    setState(() {
      _selectedDate = date!;
    });
  }

  @override
  Widget build(BuildContext context,) {
    // TODO: implement build
    _sections = ref.watch(sectionProvider);
    return Container(
      height: widget.height,
      width: 425,
      decoration: BoxDecoration(
          color: const Color(0xff626060),
          borderRadius: BorderRadius.circular(50)),
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: _value,
                maxLength: 25,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                decoration: const InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value
                          .trim()
                          .length > 10) {
                    return "Title should be b/w 1 and 10 characters";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              onChanged: (value) {
                setState(() {
                  _priority = value!;
                });
              },
              dropdownColor: const Color(0xff313131),
              value: _priority,
              decoration: const InputDecoration(
                label: Text(
                  'Priority',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              items: [
                for (final priority in Priority.values)
                  DropdownMenuItem(
                    value: priority,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: priorityColor[priority],
                          height: 10,
                          width: 10,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          priority.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              onChanged: (value) {
                setState(() {
                  _section = value!;
                });
              },
              dropdownColor: const Color(0xff313131),
              value: _section,
              decoration: const InputDecoration(
                label: Text(
                  'Section',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              items: [
                for (final section in _sections)
                  DropdownMenuItem(
                    value: section,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          section.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _selectedDate == null
                    ? OutlinedButton(
                  onPressed: _datePicker,
                  child: const Text(
                    'Select Date',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                    : ElevatedButton(
                  onPressed: _datePicker,
                  child: Text(
                    dateFormat.format(_selectedDate!),
                  ),
                ),
                const Spacer(),
                _selectedTime == null
                    ? OutlinedButton(
                  onPressed: _timePicker,
                  child: const Text(
                    'Select Time',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                    : ElevatedButton(
                  onPressed: _timePicker,
                  child: Text(
                    _selectedTime!.format(context),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
