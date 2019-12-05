import 'package:flutter/material.dart';

//Widget del Dialog utilizado para mostrar en pantalla carteles de advertencias.
class CustomDialog extends StatelessWidget{
  final title;
  final content;
  final VoidCallback callback;
  final actionText;
  int tipo=1;

  CustomDialog(this.title,this.content,this.callback,[this.actionText = "Reset"]);

  CustomDialog.type(this.title,this.content,this.callback,this.actionText,this.tipo);

  @override
  Widget build(BuildContext context) {
    //TODO: (Opcional) - Tratar de mejorar la visualización de los carteles.

    if (tipo == 1) {
      return new AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          new FlatButton(
              onPressed: callback,
              color: Colors.white,
              child: Text(actionText)
          )
        ],
      );
    } else {
      return new AlertDialog(
        title: Text(title),
        actions: <Widget>[
          new FlatButton(
              onPressed: callback,
              color: Colors.white,
              child: Text(actionText)
          ),
          new FlatButton(
              onPressed:  ()=>{Navigator.pop(context)},
              color: Colors.white,
              child: Text("No")

          )
        ],
      );
    }
  }


}