import 'package:flutter/material.dart';
import 'package:treak/Models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({required this.height});

  final height;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddTaskScreenState();
  }
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _value;
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;

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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: widget.height,
      width: 400,
      decoration: BoxDecoration(
          color: const Color(0xff626060),
          borderRadius: BorderRadius.circular(27)),
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              maxLength: 25,
              decoration: const InputDecoration(
                label: Text(
                  'Title',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length > 10) {
                  return "Title should be b/w 1 and 10 characters";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
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
              onPressed: () {},
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
