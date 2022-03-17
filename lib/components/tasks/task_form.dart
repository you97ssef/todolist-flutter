import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  final Function(String content) submitForm;
  final String buttonText;

  const TaskForm({ Key? key, required this.submitForm, required this.buttonText }) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a text',
                labelText: 'New content'),
            controller: myController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.submitForm(myController.text);
                }
              },
              child: Text(widget.buttonText),
            ),
          ),
        ],
      ),
    );
  }
}