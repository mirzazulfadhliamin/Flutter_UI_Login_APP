import 'package:flutter/material.dart';
import 'package:login_page1/classes/note.dart';

class DetailPage extends StatelessWidget {
  final Note note;

  DetailPage({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(child: Text("Data")),
                const PopupMenuItem(child: Text("Test")),
              ];
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Title: ${note.title}"),
          Text(
            "Content: ${note.content}",
          ),
        ],
      ),
    );
  }
}
