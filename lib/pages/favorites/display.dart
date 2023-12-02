
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './store.dart';
import '../../widgets/canvas.dart';
import '../../widgets/navbar.dart';


class Display extends StatefulWidget {
  final Store favorites = Store();

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  @override
  Widget build(BuildContext context) {
    Widget page = widget.favorites.empty() as bool ? blank() : list();
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
    print("Showing list of favorites");
    return ListView(
      shrinkWrap: true,
      children: [
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     ElevatedButton.icon(
        //       label: Text('Add New'),
        //       icon: Icon(Icons.person_add),
        //       onPressed: () { setState(() { context.go('/favorites/add'); }); },
        //     ),
        //     SizedBox(width: 10),
        //   ],
        // ),
        Text("You have ${widget.favorites.count()} favorites"),
        SizedBox(height: 10.0),
        for (var contact in widget.favorites.items)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(contact.split(',')[0]),
            subtitle: Text(contact.split(',')[1]),
          ),
      ],
    );
  }
}