import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Note"),
        centerTitle: true,
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(child: Text("Data")),
              const PopupMenuItem(child: Text("Test")),
            ];
          })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'images/coffelatteart.jpg',
                width: 400,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("data ")
        ],
      ),
    );
  }
}
