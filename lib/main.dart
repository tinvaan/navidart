
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'pages/routes.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData style = ThemeData(useMaterial3: true,
                                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent));
    return MaterialApp.router(routerConfig: appRouter, theme: style);
  }
}


class AppState extends ChangeNotifier {
  List<Contact> favorites = [];
  String current = String.fromEnvironment('DEFAULT_PHONE_NUMBER');

  Future addFavorites(String name, String number) async {
    if (await FlutterContacts.requestPermission()) {
      var contact = Contact(displayName: name, phones: [Phone(number)],
                            notes: [Note("NAVIDART_CONTACT")]);
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
