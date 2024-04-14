import 'package:flutter/material.dart';
import 'package:treak/Data/data.dart';

class AddGroupWidget extends StatefulWidget {
  const AddGroupWidget({super.key, required this.height,required this.addSection});

  final double height;
  final void Function(String sectionTitle, String icon) addSection;
  @override
  State<StatefulWidget> createState() {
    return _AddGroupWidgetState();
  }
}

class _AddGroupWidgetState extends State<AddGroupWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _value;
  String _icon = "School";

  void _save() {
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.addSection(_value!,_icon);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: widget.height,
      width: 425,
      decoration: BoxDecoration(
          color: const Color(0xe4191919),
          borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: _value,
              maxLength: 25,
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
                    value.trim().length > 25) {
                  return "title should be b/w 1 and 25 characters";
                }
                return null;
              },
            ),
            DropdownButtonFormField(
              alignment: AlignmentDirectional.centerEnd,
              onChanged: (value) {
                setState(() {
                  _icon = value!;
                });
              },
              dropdownColor: const Color(0xff313131),
              value: _icon,
              decoration: const InputDecoration(
                label: Text(
                  'Icon',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              items: [
                for (final icon in textToIconMap.keys)
                  DropdownMenuItem(
                    value: icon,
                    child: Center(
                      child: Icon(textToIconMap[icon], color: Colors.white,),
                    ),
                  ),
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
