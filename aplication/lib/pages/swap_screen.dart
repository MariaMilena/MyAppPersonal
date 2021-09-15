import 'package:flutter/material.dart';

enum AvailableNumber { First, Second }

class SwapScreen extends StatelessWidget {
  final AvailableNumber number;
  const SwapScreen({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String file = "";
    if(number == AvailableNumber.First){
      file = "imgPrinc";
    } else if(number == AvailableNumber.Second){
      file = "imgSecond";
    }

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset("assets/$file.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
