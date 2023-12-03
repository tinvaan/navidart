
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/canvas.dart';
import '../../widgets/navbar.dart';


class Create extends StatefulWidget {
  final String? name;
  final String? phone;

  Create({super.key, this.name, this.phone});   // ctor

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  List<String> favorites = [];
  late SharedPreferences prefs;

  // Load favorites from shared preferences into memory.
  Future<void> sync() async {
    prefs = await SharedPreferences.getInstance();
    favorites = prefs.getStringList('favorites') ?? [];
  }

  void append(String name, String phone) {
    favorites.add('$name,$phone');
    prefs.setStringList('favorites', favorites);
  }

  @override
  void initState() {
    super.initState();
    sync();
  }

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
              Title(color: Colors.black, child: Text("Create New Favorite")),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: nameCtrl,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Name")),
                )
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Phone No.")),
                )
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                tooltip: 'Please enter name and phone number',
                child: Icon(Icons.person_add),
                onPressed: () { setState(() => append(nameCtrl.text, phoneCtrl.text) ); }
              )
            ])
          )))
      ]));
    });
  }
}