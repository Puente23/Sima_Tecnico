import 'package:flutter/material.dart';
import 'package:untitled1/screens/login_screen.dart';
import 'package:untitled1/screens/tablero.dart';

/*void main() => runApp(const MyApp());*/

 void main() {
  runApp(
    MaterialApp(
      title: 'S.I.M.A.',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const Tablero(),
      },
    ),
  );
}




/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'S.I.M.A.',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    //initialRoute: '/',
    //routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    //'/': (context) => const FirstScreen(),
   //   routes: <String,WidgetBuilder>{
   // '/': (context) => const LoginScreen(),
    );
  }
}*/
