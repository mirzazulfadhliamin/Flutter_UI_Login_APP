import 'package:flutter/material.dart';
import 'package:login_page1/classes/note.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Note> notes = [];
    for (int i = 1; i <= 10; i++) {
      DateTime now = DateTime.now();
      notes.add(Note(
          "Hello, $i!",
          "Content of note $i, lorem ipsum sksk asdf placeholder llll",
          now,
          now));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: notes.length,
            itemBuilder: (context, count) {
              Note note = notes[count];
              DateTime createdAt = note.createdAt;
              DateTime updatedAt = note.updatedAt;

              return Card(
                margin:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notes[count].title,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(notes[count].content),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          "Last updated: ${updatedAt.day}/${updatedAt.month}/${updatedAt.year} ${updatedAt.hour}:${updatedAt.minute}"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
