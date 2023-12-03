
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/canvas.dart';
import '../../widgets/navbar.dart';


class Display extends StatefulWidget {
  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  List<String> favorites = [];
  late SharedPreferences prefs;

  // Load favorites from shared preferences into memory.
  Future<void> sync() async {
    prefs = await SharedPreferences.getInstance();
    favorites = prefs.getStringList('favorites') ?? [];
  }

  @override
  void initState() {
    super.initState();
    sync();
  }

  @override
  Widget build(BuildContext context) {
    Widget page = favorites.isEmpty ? blank() : list();
    return LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
      return Scaffold(body: Row(children: [SafeArea(child: Navbar(constraints: constraints,)),
                                           Expanded(child: Canvas(page: page))]));
    });
  }

  Widget blank() {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No favorites yet.'),
        SizedBox(height: 10),
        ElevatedButton.icon(
          label: Text('Add New'),
          icon: Icon(Icons.person_add),
          onPressed: () { setState(() { context.go('/favorites/add'); });}
        )
      ]
    ));
  }

  Widget list() {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text("You have ${favorites.length} favorites"),
          trailing: ElevatedButton(
            child: Icon(Icons.person_add),
            onPressed: () => { setState(() => context.go('/favorites/add') ) }, 
          ),
        ),
        SizedBox(height: 10.0),
        for (var contact in favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [ElevatedButton(onPressed: () => {}, child: Icon(Icons.phone)),
                         SizedBox(width: 5.0),
                         ElevatedButton(onPressed: () => {}, child: Icon(Icons.delete))],
            ),
            title: Text(contact.split(',')[0]),
            subtitle: Text(contact.split(',')[1]),
          ),
      ],
    );
  }
}