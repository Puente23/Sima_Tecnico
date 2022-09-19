import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/utilities/themas.dart';
import 'dart:math';
import 'package:untitled1/widgets/round_button.dart';
import 'package:untitled1/utilities/themas.dart';

class Tablero extends StatefulWidget {
  const Tablero({super.key});
  @override
  State<Tablero> createState() => _Tablero();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Tablero extends State<Tablero> {
  AnimationController? _loadingController;
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      ' ',
      style: optionStyle,
    ),
    Text(
      ' ',
      style: optionStyle,
    ),
    Text(
      ' ',
      style: optionStyle,
    ),
    Text(
      ' ',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Menu Admin"),
              leading: const Icon(Icons.account_circle_rounded),
              leadingWidth: 100, // default is 56
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.add_alert),
                  tooltip: 'Notificaciones',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Notificaciones')));
                  },
                ),
                const Icon(Icons.more_vert),
                SizedBox(
                  width: 30,
                  child: Image.asset(
                    'assets/logos/descarga.png',
                  ),
                ),
              ],
              backgroundColor: Colors.lightGreen[800],
              shadowColor: Colors.lightGreenAccent[100],
              toolbarTextStyle: TextTheme(
                headline6: TextStyle(
                  // headline6 is used for setting title's theme
                  color: Colors.amber[200],
                  fontSize: 24,
                ),
              ).bodyText2,
              titleTextStyle: TextTheme(
                headline6: TextStyle(
                  // headline6 is used for setting title's theme
                  color: Colors.amber[200],
                  fontSize: 24,
                ),
              ).headline6,
            ),
            drawer: const Drawer(),
            backgroundColor: Colors.lightGreen,
            body: Container(),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Inicio',
                  backgroundColor: Colors.white12,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  label: 'Graficas',
                  backgroundColor: Colors.white12,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_outlined),
                  label: 'Reportes',
                  backgroundColor: Colors.white12,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Configuraciones',
                  backgroundColor: Colors.white12,
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            )));
  }
}
