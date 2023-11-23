import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart' show AppState;


class ShowFavorites extends StatefulWidget {
  @override
  State<ShowFavorites> createState() => _ShowFavoritesState();
}


class _ShowFavoritesState extends State<ShowFavorites> {
  @override
  Widget build(BuildContext context) {
    var app = context.watch<AppState>();
    print("Showing list of favorites");
    return ListView(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.person_add),
              label: Text('Add New'),
              onPressed: () {
                // TODO: reload the view to different state
                // setState(() { add(app); });
              },
            ),
            SizedBox(width: 10),
          ],
        ),
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
