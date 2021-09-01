import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final int qtdL;
  final String titulo;
  final TextEditingController controller;
  const TextForm({Key key, this.qtdL, this.titulo, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidate: false,
      controller: controller,
      decoration: InputDecoration(
        labelText: titulo,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        alignLabelWithHint: true,
      ),
      maxLines: qtdL,
    );
  }
}
