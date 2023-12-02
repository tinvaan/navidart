
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Store extends State<StatefulWidget>{
  List<String> items = [];
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    sync();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Subclass responsibility');
  }

  Future<void> sync() async {
    prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList('favorites') ?? [];
  }

  List<String> all() {
    sync();
    return items;
  }

  bool empty() {
    sync();
    return items.isEmpty;
  }

  int count() {
    sync();
    return items.length;
  }

  Future<void> clear() async {
    await sync();
    setState(() {
      items.clear();
      prefs.setStringList('favorites', items);
    });
  }

  Future<void> append(String name, String number) async {
    await sync();
    setState(() {
      items.add('$name,$number');
      prefs.setStringList('favorites', items);
    });
  }

  Future<void> remove(String name, String? number) async {
    await sync();
    setState(() {
      items.removeWhere(
        (fav) => fav.contains(name) || (number != null && fav.contains(number))
      );
      prefs.setStringList('favorites', items);
    });
  }
}