import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import './index.dart';
import '../utils/snackbar.dart';


class ContactScreen extends StatefulWidget {

  HomeScreen home() { return HomeScreen(adapterState: BluetoothAdapterState.unknown); }

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}


class NewContactScreen extends StatefulWidget {

  HomeScreen home() { return HomeScreen(adapterState: BluetoothAdapterState.unknown); }

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}


class _ContactScreenState extends State<ContactScreen> {
  late SharedPreferences prefs;
  List<String> _contacts = [];

  Future<void> synchronise() async {
    prefs = await SharedPreferences.getInstance();
    _contacts = prefs.getStringList('contacts') ?? [];
  }

  void read(BuildContext context) async {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => NewContactScreen(), settings: RouteSettings(name: '/NewContact'));
    Navigator.of(context).push(route);
  }

  void clear() {
    synchronise(); // overkill

    _contacts.clear();
    prefs.setStringList('contacts', _contacts);
  }

  String pop(int index) {
    synchronise(); // overkill

    String popped = _contacts.removeAt(index);
    prefs.setStringList('contacts', _contacts);
    return popped;
  }

  Widget blank(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No favorites yet.'),
        SizedBox(height: 10),
        ElevatedButton.icon(
          label: Text('Add New'),
          icon: Icon(Icons.person_add),
          onPressed: () { setState(() { read(context); });}
        )
      ]
    );
  }

  Widget list(BuildContext context) {
    return ListView(
      children: [
        AppBar(title: Text('Favorites'), backgroundColor: Colors.indigoAccent),
        ListTile(
          title: Text("You have ${_contacts.length} favorites"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [ElevatedButton(child: Icon(Icons.person_add),
                                      onPressed: () { /*read(context); Navigator.pop(context);*/ }),
                       SizedBox(width: 5.0,),
                       ElevatedButton(child: Icon(Icons.cleaning_services),
                                      onPressed: () => { setState(() => clear() )})],
          ),
        ),
        SizedBox(height: 10.0),
        for (var (index, contact) in _contacts.indexed)
          ListTile(
            leading: Icon(Icons.favorite),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [ElevatedButton(child: Icon(Icons.phone),
                                        onPressed: () async {
                                          await FlutterPhoneDirectCaller.callNumber(contact.split(',')[1]);
                                        }),
                         SizedBox(width: 5.0),
                         ElevatedButton(child: Icon(Icons.delete),
                                        onPressed: () => { setState(() => pop(index) )})],
            ),
            title: Text(contact.split(',')[0]),
            subtitle: Text(contact.split(',')[1]),
          ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    synchronise();
  }

  @override
  Widget build(BuildContext context) {
    Widget page = _contacts.isEmpty ? blank(context) : list(context);
    return ScaffoldMessenger(
      key: Snackbar.snackBarKeyB,
      child: Scaffold(
        body: Center(child: page),

        // NOTE: Honestly, I don't know why this works but it works!
        //       Bottom navigation bar works inspite of this comment.

        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: index,
        //   selectedItemColor: Colors.indigoAccent,
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'Devices'),
        //     BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Favorites')
        //   ],
        //   onTap: (int val) {
        //     setState(() { index = val; });
        //   },
        // ),
      ),
    );
  }
}


class _NewContactScreenState extends State<NewContactScreen> {
  late SharedPreferences prefs;

  int index = 0;
  List<String> _contacts = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  Future<void> synchronise() async {
    prefs = await SharedPreferences.getInstance();
    _contacts = prefs.getStringList('contacts') ?? [];
  }

  void append(String name, String phone) {
    synchronise(); // overkill

    _contacts.add('$name,$phone');
    prefs.setStringList('contacts', _contacts);
  }

  @override
  void initState() {
    super.initState();
    synchronise();
  }

  @override
  Widget build(BuildContext context) {
    Widget page = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Title(color: Colors.black, child: Text("Create New Favorite")),
        SizedBox(height: 10),
        SizedBox(
          width: 250,
          child: TextField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Name")),
          )
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 250,
          child: TextField(
            controller: _phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Phone No.")),
          )
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          tooltip: 'Please enter name and phone number',
          child: Icon(Icons.person_add),
          onPressed: () { setState(() => append(_nameController.text, _phoneController.text) ); }
        )
      ]
    );
    return ScaffoldMessenger(
      key: Snackbar.snackBarKeyC,
      child: Scaffold(
        body: Center(child: page),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.indigoAccent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'Devices'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Favorites')
          ],
          onTap: (int val) {
            setState(() {
              index = val;
              Navigator.of(context).pop();
              page = widget.home().pages().elementAt(index);
            });
          },
        ),
      ),
    );
  }
}