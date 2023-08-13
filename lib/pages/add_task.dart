import 'package:flutter/material.dart';
import 'package:login_page1/classes/note.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isInputNotEmpty = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _updateInputState(String _) {
    setState(() {
      isInputNotEmpty = _titleController.text.trim().isNotEmpty ||
          _contentController.text.trim().isNotEmpty;
    });
  }

  void _addNote() {
    if (!isInputNotEmpty) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('New note can not be empty'),
          duration: Duration(milliseconds: 1000),
        ));
      return;
    }

    Note newNote = Note(
      _titleController.text,
      _contentController.text,
      DateTime.now(),
      DateTime.now(),
    );

    Navigator.pop(context, newNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              icon: Icon(Icons.check),
              onPressed: _addNote,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //text date
              Text(DateFormat('HH:mm:ss , dd-MM-yyyy ').format(DateTime.now())),
              SizedBox(height: 10),
              //input title
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.green,
                maxLength: null,
                controller: _titleController,
                onChanged: _updateInputState,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 146, 146, 146),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(height: 16),
              //input description
              TextField(
                keyboardType: TextInputType.multiline,
                cursorColor: Colors.green,
                maxLines: null,
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: 'Note something down',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color.fromARGB(255, 146, 146, 146)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
