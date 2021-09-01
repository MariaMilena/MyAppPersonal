import 'package:flutter/material.dart';

import 'package:aplication/sidebar/saidebar_layout.dart';
import 'package:aplication/pages/form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App personal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: SidebarLayout(),
      initialRoute: '/',
      routes: {
        '/':(context) => SidebarLayout(),
        '/formulario':(context) => Formulario(),
      },
    );
  }
}