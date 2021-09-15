import 'package:flutter/material.dart';

import 'package:aplication/pages/swap_screen.dart';
import 'package:aplication/pages/form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*PageController _pageController = PageController(
    initialPage: 0
  );
  int index = 0;

  Widget swapScreen = SwapScreen(number: AvailableNumber.First);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageView(
      //controller: _pageController,
      /*onPageChanged: (page) {
        setState(() {
          index = page;
        });
      },*/
      children: [
        SwapScreen(number: AvailableNumber.First),
        //SwapScreen(number: AvailableNumber.Second)
        Formulario()
      ],
    );
  }
}

/*
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/imgPrinc.png"),
        )
      ),
    );
  }
}
*/