import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import '../pages/text_form.dart';
import '../pages/botao_next.dart';

class Formulario extends StatelessWidget {
  //const Formulario({Key key}) : super(key: key);
  TextEditingController _mens = TextEditingController();
  TextEditingController _ass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("FORM"),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.height*0.04, left: size.height*0.025, right: size.height*0.025),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text("Contato", style: TextStyle(fontWeight: FontWeight.w800, fontSize: size.height*0.04)),
                subtitle: Text("Preencha este formulário para entrar em contato com o criador do aplicativo"),
              ),
              SizedBox(height: size.height*0.04),
              TextForm(qtdL: 1,titulo: "Assunto", controller: _ass),
              SizedBox(height: size.height*0.04),
              TextForm(qtdL: 5,titulo: "Mensagem", controller: _mens),
              SizedBox(height: size.height*0.04),
              Botao_next(rota: '/', nomeBot: "ENVIAR", icone: Icons.send, funcao: sendEmailFunction),
              //BoatoForm(size: size),
            ],
          ),
        ),
      ),
    );
  }

  void sendEmailFunction({String destinatario = 'mariam1l3n4@outlook.com'}) async {
    final Email email = Email(
      body: _mens.text,
      subject: 'Contato APP - '+_ass.text,
      recipients: [destinatario],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }
}

