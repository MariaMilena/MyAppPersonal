import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedStreamSink = isSidebarOpenedStreamController.sink;
  }

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
                    color: Colors.amber,
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        ListTile(
                          title: Text(
                            "Milena",
                            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            "milena20182018@gmail.com",
                            style: TextStyle(color: Colors.amber.shade100, fontSize: 15),
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
                        )
                      ],
                    ),
                  )
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
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
              )
            ],
          ),
        );
      },
    );
  }
}
