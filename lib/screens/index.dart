import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import './contacts.dart';
import './scan.dart';
import '../utils/snackbar.dart';


class HomeScreen extends StatefulWidget {
  final BluetoothAdapterState? adapterState;
  final List<Widget> _pages = [ ScanScreen(), ContactScreen() ];

  HomeScreen({super.key, this.adapterState}); // ctor

  List<Widget> pages() { return _pages; }

  @override
  State<HomeScreen> createState() => HomeScreenState();
}


class HomeScreenState extends State<HomeScreen> {
  int index = 0;

  Widget buildBluetoothOffIcon(BuildContext context) {
    return const Icon(
      Icons.bluetooth_disabled,
      size: 200.0,
      color: Colors.white54,
    );
  }

  Widget buildTitle(BuildContext context) {
    String? state = widget.adapterState?.toString().split(".").last;
    return Text(
      'Bluetooth Adapter is ${state != null ? state : 'not available'}',
      style: Theme.of(context).primaryTextTheme.titleSmall?.copyWith(color: Colors.white),
    );
  }

  Widget buildTurnOnButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: const Text('TURN ON'),
        onPressed: () async {
          try {
            if (Platform.isAndroid) {
              await FlutterBluePlus.turnOn();
            }
          } catch (e) {
            Snackbar.show(ABC.a, prettyException("Error Turning On:", e), success: false);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: Snackbar.snackBarKeyA,
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(child: widget.pages().elementAt(index)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.indigoAccent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'Devices'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Favorites')
          ],
          onTap: (int val) {
            setState(() { index = val; });
          },
        ),
      ),
    );
  }
}
