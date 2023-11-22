import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart' show AppState;

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var addIcon = Icons.person_add;
    var appState = context.watch<AppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No favorites yet.'),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // appState.toggleFavorite();
                  },
                  icon: Icon(addIcon),
                  label: Text('Add New'),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var contact in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(contact.displayName),
            subtitle: Text(contact.phones[0].toString()),
          ),
      ],
    );
  }
}
