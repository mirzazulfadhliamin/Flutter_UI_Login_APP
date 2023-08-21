import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_page1/classes/note.dart';
import 'package:login_page1/pages/add_task.dart';

import 'dart:math';

import 'package:login_page1/pages/edit_task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var box = Hive.box("data");

  Random random = Random();
  @override
  void initState() {
    super.initState();
  }

  void _addNewNote(Note newNote, Box box) async {
    List<dynamic> dynamicNotes = box.get("notes", defaultValue: <Note>[]);
    List<Note> notes = dynamicNotes.cast();
    notes.add(newNote);
    await box.put("notes", notes);
  }

  void _removeTaskItem(int index, Box box) async {
    List<dynamic> dynamicNotes = box.get("notes", defaultValue: <Note>[]);
    List<Note> notes = dynamicNotes.cast();
    notes.removeAt(index);
    notes.forEach((element) {
      print(element.title);
    });
    await box.put("notes", notes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () async {
            Note? newNote = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            );

            if (newNote != null) {
              setState(() {
                _addNewNote(newNote, box);
              });
            }
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 33, 94, 35),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        //ListView
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (BuildContext context, value, Widget? child) {
            List<dynamic> dynamicNotes =
                value.get("notes", defaultValue: <Note>[]);
            List<Note> notes = dynamicNotes.cast();

            if (notes.isNotEmpty) {
              return ListView.builder(
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
                      _removeTaskItem(count, value);
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
                          Note? editNote = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTask(note: note),
                            ),
                          );
                          if (editNote != null) {
                            setState(() {
                              _addNewNote(editNote, value);
                              _removeTaskItem(count, value);
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
                padding: EdgeInsets.only(bottom: 100),
              );
            } else {
              return Center(
                  child: Image.asset(
                'images/nonotes.png',
                height: 100,
                color: const Color.fromARGB(74, 255, 255, 255),
              ));
            }
          },
        ),
      ),
    );
  }
}
