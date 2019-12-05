import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tateti_view.dart';

//Pantalla de Inicio

class FirstPage extends StatefulWidget{

  @override
  FirstPageState createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage>{


  @override
  Widget build(BuildContext context) {
    //TODO: Completar código de la pantalla de inicio y que navegue a la tateti_view
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
              child: Text("Ta-te-ti"),
              onPressed: (){
                //TODO: Acá iría la navegación a la página tateti_view.
              }
          ),
        ),
      )
    );
  }

}