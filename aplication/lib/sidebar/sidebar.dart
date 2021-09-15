import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../sidebar/menu_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedStreamSink;

  final _animationDuration = const Duration(milliseconds: 500);

  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedStreamSink = isSidebarOpenedStreamController.sink;
  }
  @override

  void dispose(){
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedStreamSink.close();
    super.dispose();
  }

  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if(isAnimationCompleted){
      isSidebarOpenedStreamSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedStreamSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSidebarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSidebarOpenedAsync.data ? 0 : -screenWidth, // -screenWidth : Ao encolher a tela os componentes de dentro do SB nao saem do lugar
          right: isSidebarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    height: screenHeight,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth*0.06),
                    color: Colors.amber,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 100),
                          ListTile(
                            title: Text(
                              "Milena",
                              style: TextStyle(color: Colors.white, fontSize: screenHeight*0.04, fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              "milena20182018@gmail.com",
                              style: TextStyle(color: Colors.amber.shade100, fontSize: screenHeight*0.023),
                            ),
                            leading: CircleAvatar(
                              /*child: Icon(
                                Icons.perm_identity,
                                color: Colors.white,
                              ),*/
                              radius: 40,
                              backgroundImage: AssetImage("assets/perfil.jpeg"),
                            ),
                          ),
                          Divider( // Onde cria a linha horizontal que separa o cabeçalho do corpo do SB
                            height: 64,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.8),
                            indent: 32,
                            endIndent: 32,
                          ),
                          MenuItem(icon: FontAwesomeIcons.instagram, title: "Instagram", url: "https://www.instagram.com/mm1l3n4/"),
                          MenuItem(icon: FontAwesomeIcons.linkedin, title: "Linkedin", url: "https://www.linkedin.com/in/maria-milena-0a6b22212/"),
                          MenuItem(icon: FontAwesomeIcons.github, title: "Github", url: "https://github.com/MariaMilena"),
                          // MenuItem(icon: FontAwesomeIcons.google, title: "Gmail", url: Uri(scheme: 'Milena', path: "milena20182018@gmail.com").toString()),
                          MenuItem(icon: FontAwesomeIcons.whatsapp, title: "Whatsapp", url: "https://api.whatsapp.com/send?phone=5579981341962"),
                        ],
                      ),
                    ),
                  )
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.amber,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
