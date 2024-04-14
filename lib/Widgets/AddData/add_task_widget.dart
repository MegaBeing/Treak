import 'package:flutter/material.dart';
import 'package:treak/Models/task_model.dart';
import '../../Models/section_model.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget(
      {super.key,
      required this.height,
      required this.sectionList,
      required this.addTask});

  final double height;
  final List<SectionModel> sectionList;
  final void Function(SectionModel section, TaskModel task) addTask;

  @override
  State<AddTaskWidget> createState() {
    // TODO: implement createState
    return _AddTaskWidgetState();
  }
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _value;
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;
  Priority _priority = Priority.low;
  late SectionModel _section;

  void _save() {
    if (_selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('No Date Selected'),
          content: const Text('Please select The date of the following task'),
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
        builder: (ctx) => AlertDialog(
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
      var task = TaskModel(
        title: _value!,
        dateTime: DateTime(_selectedDate!.year, _selectedDate!.month,
            _selectedDate!.day, _selectedTime!.hour, _selectedTime!.minute),
        priority: _priority,
      );
      widget.addTask(_section, task);
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
        lastDate: DateTime(DateTime.now().year + 1));
    setState(() {
      _selectedDate = date!;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    // TODO: implement build
    _section = widget.sectionList[0];
    return Container(
      height: widget.height,
      width: 400,
      decoration: BoxDecoration(
          color: const Color(0xe4191919),
          borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: _value,
                maxLength: 50,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length > 50) {
                    return "title should be b/w 1 and 50 characters";
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
                for (final section in widget.sectionList)
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
