
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';


class Store {
  List<String> items = [];
  late SharedPreferences prefs;

  Future<void> sync() async {
    prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList('favorites') ?? [];
  }

  Future<List> all() async {
    await sync();
    return items;
  }

  Future<bool> empty() async {
    await sync();
    return items.isEmpty;
  }

  Future<int> count() async {
    await sync();
    return items.length;
  }

  Future<void> clear() async {
    await sync();
    items.clear();
    prefs.setStringList('favorites', items);
  }

  Future<void> append(String name, String number) async {
    await sync();
    items.add('$name,$number');
    prefs.setStringList('favorites', items);
  }

  Future<void> remove(String name, String? number) async {
    await sync();
    items.removeWhere(
      (fav) => fav.contains(name) || (number != null && fav.contains(number))
    );
    prefs.setStringList('favorites', items);
  }
}