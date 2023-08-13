import 'package:flutter/material.dart';
import 'package:login_page1/classes/note.dart';
import 'package:login_page1/pages/add_task.dart';

import 'dart:math';

import 'package:login_page1/pages/edit_task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [
    Note(
      'Pertemuan Hari Ini',
      'Pembahasan rambut harus rapi.',
      DateTime(2023, 8, 13, 10, 0),
      DateTime(2023, 8, 13, 12, 0),
    ),
    Note(
      'Idea Kreatif',
      'Menemukan ide kreatif untuk kampanye Banteng merah.',
      DateTime(2023, 8, 10, 15, 30),
      DateTime(2023, 8, 11, 9, 45),
    ),
    Note(
      'List Belanja',
      'Telur, susu, roti, sayuran.',
      DateTime(2023, 8, 9, 18, 0),
      DateTime(2023, 8, 10, 8, 15),
    ),
    Note(
      'Rencana Liburan',
      'Destinasi: Pantai Indah. Persiapan: Tiket, penginapan.',
      DateTime(2023, 7, 25, 16, 0),
      DateTime(2023, 8, 2, 10, 30),
    ),
    Note(
      'Presentasi Proyek',
      'Persiapan untuk presentasi fluter besok.',
      DateTime(2023, 8, 1, 9, 0),
      DateTime(2023, 8, 1, 18, 0),
    ),
  ];

  Random random = Random();
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
        title: const Text(
          "Notes",
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      //floatingActioinButton
      floatingActionButton: Container(
        margin: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () async {
            var newNote = await Navigator.push(
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
          backgroundColor: Color.fromARGB(255, 33, 94, 35),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: notes.length <= 0
          ? Center(
              child: Image.asset(
              'images/nonotes.png',
              height: 100,
              color: const Color.fromARGB(74, 255, 255, 255),
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
                          var editNote = await Navigator.push(
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
                padding: EdgeInsets.only(bottom: 100),
              ),
            ),
    );
  }
}
