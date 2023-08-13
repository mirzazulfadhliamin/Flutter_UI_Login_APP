import 'package:flutter/material.dart';
import 'package:login_page1/classes/note.dart';
import 'package:login_page1/pages/add_task.dart';
import 'package:login_page1/pages/detail-page.dart';

import 'package:login_page1/pages/edit_task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
  }

  void _addNewNote(Note newNote) {
    setState(() {
      notes.add(newNote);
    });
  }

  void _removeTaskItem(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      //floatingActioinButton
      floatingActionButton: Container(
        margin: EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () async {
            Note newNote = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            );

            if (newNote != null) {
              setState(() {
                _addNewNote(newNote);
              });
            }
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: notes.length <= 0
          ? Center(
              child: Image.asset(
              'images/nonotes.png',
              height: 100,
              color: Color.fromARGB(74, 255, 255, 255),
            ))
          : SafeArea(
              //ListView
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: notes.length,
                itemBuilder: (context, count) {
                  Note note = notes[count];
                  DateTime updatedAt = note.updatedAt;
                  //Dismissible
                  return Dismissible(
                    key: Key(note.title),
                    onDismissed: (direction) {
                      setState(() {
                        notes.removeAt(count);
                      });
                    },
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 0),
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(Icons.delete, size: 20),
                    ),

                    //card
                    child: Card(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: InkWell(
                        onTap: () async {
                          Note editNote = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTask(note: note),
                            ),
                          );
                          if (editNote != null) {
                            setState(() {
                              _addNewNote(editNote);
                              _removeTaskItem(count);
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //title
                              Text(
                                note.title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              //content
                              Text(
                                note.content,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Last updated: ${updatedAt.day}/${updatedAt.month}/${updatedAt.year} ${updatedAt.hour}:${updatedAt.minute}",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
