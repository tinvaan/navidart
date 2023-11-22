import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'pages/index.dart' show Index;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Navidart',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        ),
        home: Index(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  var current = '+6586791807';
  List<Contact> favorites = [];

  Future addFavorites(String name, String number) async {
    if (await FlutterContacts.requestPermission()) {
      var contact = Contact(
        displayName: name,
        phones: [Phone(number)],
        notes: [Note("NAVIDART_CONTACT")],
      );
      await contact.insert();
      favorites.add(contact);
    }
    notifyListeners();
  }

  Future removeFavorite(Contact addr) async {
    if (favorites.contains(addr)) {
      favorites.remove(addr); // remove from AppState
    }

    if (await FlutterContacts.requestPermission()) {
      await addr.delete(); // remove from contact list
    }

    notifyListeners();
  }
}

void main() {
  runApp(const App());
}
