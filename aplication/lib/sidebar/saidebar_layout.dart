import 'package:flutter/material.dart';

import '../sidebar/sidebar.dart';
import '../pages/pagina_teste.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePage(),
          SideBar()
        ],
      ),
    );
  }
}
