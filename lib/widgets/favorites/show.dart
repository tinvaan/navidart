
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart' show AppState;


class ShowFavorites extends StatefulWidget {
  @override
  State<ShowFavorites> createState() => _ShowFavoritesState();
}


class _ShowFavoritesState extends State<ShowFavorites> {
  @override
  Widget build(BuildContext context) {
    var app = context.watch<AppState>();
    if (app.favorites.isEmpty) {
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
        Text("You have ${app.favorites.length} favorites"),
        SizedBox(height: 10.0),
        for (var contact in app.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(contact.displayName),
            subtitle: Text(contact.phones[0].toString()),
          ),
      ],
    );
  }
}
