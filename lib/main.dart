/*
Taller Flutter InforSanLuis - 2019

**Ejemplo para entrega Final del taller.

La lógica del juego en este código se basa en que existen 9 botones identificados unívocamente
y cada jugador tiene una lista asociada con los botones que ha presionado. Entonces en función
de la lista de cada jugador, luego se chequea quien es el ganador, además de setear los botones
como ya presionados y con un color y texto representando quien lo presionó.

**Revisar los TODO*/ /*que es donde deberán completar código.

 TAREA: *Completar código en CheckWinner()
        *Agregar pantalla de inicio que nos lleve a Tateti_View
        *Darle estilo a los botones del Tateti_View y a la pantalla (opcional) en sí.

 */
import 'package:flutter/material.dart';
import 'package:todoapp/first_page.dart';
import 'package:todoapp/tateti_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.black),
      home: new FirstPage(),

    );
  }
}