
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class NewFavoriteForm extends StatelessWidget {
  final name = TextEditingController();
  final phone = TextEditingController();

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
            child: TextField(controller: name, decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Name")),)
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 250,
            child: TextField(controller: phone, decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Phone No.")),)
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            tooltip: 'Please enter name and phone number',
            child: Icon(Icons.person_add),
            onPressed: () => name.text.isEmpty || phone.text.isEmpty 
              ? null
              : context.go(Uri(path: '/favorites/add', queryParameters: {'name': name.text, 'phone': phone.text}).toString()),
          )
        ])
      )
    );
  }
}