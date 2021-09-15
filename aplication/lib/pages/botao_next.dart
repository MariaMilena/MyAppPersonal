import 'package:flutter/material.dart';

class Botao_next extends StatelessWidget {
  final String rota;
  final String nomeBot;
  final IconData icone;
  final Function funcao;
  const Botao_next({Key key, this.rota, this.nomeBot, this.icone, this.funcao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => funcao!= null ? funcao() : Navigator.pushNamed(context, rota),
        //Navigator.pushNamed(context, rota);
        /*const snackBar = SnackBar(content: Text("Proximo"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
      //},
      child: Container(
        width: size.width*0.78,
        height: size.height*0.09,
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(size.height*0.07)
            //borderRadius: BorderRadius.only(topRight: Radius.elliptical(100, 50))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width*0.1),
              child: Text(nomeBot, style: TextStyle(fontSize: size.height*0.035, fontWeight: FontWeight.w600, color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width*0.015),
              child: Container(
                width: size.width*0.16,
                height: size.height*0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(size.height*0.07)
                ),
                child: Icon(
                  icone,
                  color: Colors.cyan,
                  size: size.width*0.1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


