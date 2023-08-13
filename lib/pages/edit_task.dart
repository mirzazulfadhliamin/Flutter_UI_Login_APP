import 'package:flutter/material.dart';
import 'package:login_page1/classes/note.dart';
import 'package:intl/intl.dart';

class EditTask extends StatefulWidget {
  final Note note;
  EditTask({
    super.key,
    required this.note,
  });

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController _titileController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titileController.text = widget.note.title;
    _contentController.text = widget.note.content;
  }

  void _edittask() {
    if (_titileController.text.isNotEmpty &&
        _contentController.text.isNotEmpty) {
      Note newNote = Note(
        _titileController.text,
        _contentController.text,
        DateTime.now(),
        DateTime.now(),
      );

      Navigator.pop(context, newNote);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _edittask();
        },
        child: const Text(
          'SAVE',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.green,
                maxLength: null,
                controller: _titileController,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    fontSize: 20,
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


/*body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titileController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Note editedNote = Note(
                  _titileController.text,
                  _contentController.text,
                  widget.note.createdAt,
                  DateTime.now(),
                );

                Navigator.pop(context, editedNote);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    ); */