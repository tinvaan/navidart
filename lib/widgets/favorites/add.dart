
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils.dart';
import '../../pages/favorites.dart' show Display;


/// Add a new favorite
class AddFavorites extends StatefulWidget {
  final String? name;
  final String? phone;

  // ctor
  AddFavorites({super.key, this.name, this.phone});

  @override
  State<AddFavorites> createState() => _AddFavoritesState();
}

class _AddFavoritesState extends State<AddFavorites> {
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    if (favorites.isNotEmpty) {
      return container(Center(child: Display()), context);
    }

    print('Adding a new favorite(${widget.name}, ${widget.phone})');
    final TextEditingController nameCtrl = TextEditingController();
    final TextEditingController phoneCtrl = TextEditingController();
    return Scaffold(
      body: Center(child: Column(
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
            onPressed: () => add(nameCtrl.text, phoneCtrl.text),
          )
        ])
      )
    );
  }

  Future<void> add(String name, String phone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favorites = prefs.getStringList('favorites') ?? [];
      favorites.add('$name,$phone');
      prefs.setStringList('favorites', favorites);
    });
  }

  Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favorites = prefs.getStringList('favorites') ?? [];
    });
  }
}
