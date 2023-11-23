
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class NewFavoriteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(title: Text("Create New Favorite")),
          SizedBox(height: 10),
          SizedBox(
            width: 250,
            child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Name")),)
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 250,
            child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Phone No.")),)
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            child: Icon(Icons.edit_note_rounded),
            onPressed: () => context.go('/favorites/add'),
          )
        ])
      )
    );
  }
}