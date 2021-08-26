import 'package:flutter/material.dart';

class Botao_next extends StatelessWidget {
  const Botao_next({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: size.height*0.035,
          child: GestureDetector(
            onTap: () {
              const snackBar = SnackBar(content: Text("Proximo"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
              width: size.width*0.85,
              height: size.height*0.13,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(size.height*0.07)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.1),
                    child: Text("NEXT STEP", style: TextStyle(fontSize: size.height*0.035, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width*0.02),
                    child: Container(
                      width: size.width*0.2,
                      height: size.height*0.11,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(size.height*0.07)
                      ),
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.cyan,
                        size: size.width*0.1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
