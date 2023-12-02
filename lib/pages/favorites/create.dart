
import 'package:flutter/material.dart';

import './store.dart';
import '../../widgets/canvas.dart';
import '../../widgets/navbar.dart';


class Create extends StatefulWidget {
  final String? name;
  final String? phone;
  final Store favorites = Store();

  Create({super.key, this.name, this.phone});   // ctor

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameCtrl = TextEditingController();
    final TextEditingController phoneCtrl = TextEditingController();

    return LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
      return Scaffold(body: Row(children: [
        SafeArea(child: Navbar(constraints: constraints,)),
        Expanded(child: Canvas(
          page: Center(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(title: Text("Create New Favorite")),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: TextField(controller: nameCtrl, decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Name")),)
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: TextField(controller: phoneCtrl, decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Phone No.")),)
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                tooltip: 'Please enter name and phone number',
                child: Icon(Icons.person_add),
                onPressed: () => widget.favorites.append(nameCtrl.text, phoneCtrl.text),
              )
            ])
          )))
      ]));
    });
  }
}