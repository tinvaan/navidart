
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShowFavorites extends StatefulWidget {
  @override
  State<ShowFavorites> createState() => _ShowFavoritesState();
}


class _ShowFavoritesState extends State<ShowFavorites> {
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    load();
  }
 
  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      setState(() {
        context.go(Uri(path: '/favorites', queryParameters: {'empty': true}).toString());
      });
    }

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
        Text("You have ${favorites.length} favorites"),
        SizedBox(height: 10.0),
        for (var contact in favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(contact.split(',')[0]),
            subtitle: Text(contact.split(',')[1]),
          ),
      ],
    );
  }

 Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favorites = prefs.getStringList('favorites') ?? [];
    });
  }

}
