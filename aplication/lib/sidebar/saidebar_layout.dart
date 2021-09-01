import 'package:flutter/material.dart';

import '../sidebar/sidebar.dart';
import '../pages/pagina_teste.dart';
import 'package:aplication/pages/botao_next.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          HomePage(),
          Positioned(
              bottom: size.height*0.035,
              child: Botao_next(rota: '/formulario', nomeBot: "PRÓXIMO", icone: Icons.arrow_forward_outlined)
          ),
          SideBar(),
        ],
      ),
    );
  }
}