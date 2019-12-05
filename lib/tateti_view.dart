import 'package:flutter/material.dart';
import 'package:todoapp/custom_dialog.dart';
import 'package:todoapp/game_button.dart';

class Tateti_View extends StatefulWidget{
  @override
  _Tateti_ViewState createState() => new _Tateti_ViewState();
}

class _Tateti_ViewState extends State<Tateti_View>{


  List<GameButton> buttonList; //Lista de Botones

  var player1; //Jugador 1 - Será una lista conteniendo los botones que haya presionado
  var player2; //Jugador 2 - Será una lista conteniendo los botones que haya presionado
  var activePlayer; //Identifica que jugador está jugando .

  @override
  void initState(){
    //INICIALIZACIÓN DE JUEGO
    buttonList = doInit(); //Inicializamos la Lista con los botones
    activePlayer = 1; //Seteamos que jugador será el primero en tocar.

    super.initState();

  }

  void playGame(GameButton gameButton){

    //Con setState, hace que se redibuje la pantalla con los botones actualizados,

    setState(() {
      if(activePlayer == 1){
        gameButton.text = "X"; //X para el jugador 1
        gameButton.backgroundColor= Colors.red;
        //Como acaba de jugar el Jugador 1, seteamos al jugador activo como el 2
        activePlayer = 2;
        //Añadimos a la lista del jugador 1 el botón presionado.
        player1.add(gameButton.id);
      }else{
        gameButton.text = "0"; //0 para el jugador 2
        gameButton.backgroundColor = Colors.black;
        //Como acaba de jugar el Jugador 2, seteamos al jugador activo como el 1
        activePlayer = 1;
        //Añadimos a la lista del jugador 2 el botón presionado.
        player2.add(gameButton.id);

      }
      //Deshabilitamos el botón ya presionado para que no pueda ser presionado de vuelta.
      gameButton.enabled = false;

      //Comprobamos si alguno de los dos jugadores ganó luego de hacer presionar el botón.
      checkWinner();
    });
  }

  void checkWinner(){
    var winner = -1; //Identificador que tendrá que jugador ha ganado
    //En el caso que quede en -1, ninguno ha ganado
    //Caso contrario, debería ir el jugador 1 o 2 dependiendo quien hizo ta-te-ti

    /* TODO: COMPLETAR CÓDIGO PARA CONTROLAR QUIEN GANÓ */

    if( player1.contains(1) && player1.contains(2) && player1.contains(3)) //ejemplo
      winner=1;

    /* FIN COMPLETAR CÓDIGO PARA CONTROLAR QUIEN GANÓ */

    if(winner != -1){

      if(winner == 1){
        //Forma de mostrar un "Dialog" en pantalla.
        showDialog(
          context: context,
          builder: (_HomePageState) =>new CustomDialog("Player 1 Wins!!","Press the reset button to start again.",resetGame)
          );
      } else{
        showDialog(
            context: context,
            builder: (_HomePageState) =>new CustomDialog("Player 2 Wins!!","Press the reset button to start again.",resetGame)
        );
      }
    } //En caso de que quede en -1 no hacer nada, dejar que sigan jugando.

    /*OPCIONAL: Agregar control de cuando ya no hay manera que alguien gane, salte un cartel de resetear el juego */
  }

  //Función para resetear el juego.
  void resetGame(){
    if(Navigator.canPop(context))
      Navigator.pop(context);
    setState(() {
      buttonList=doInit();
    });
  }

  List<GameButton> doInit(){

    //Definimos una Lista de GameButtons, cada botón identificado unívocamente
    //Lo cual nos será útil para saber que botón ha presionado cada jugador.
    var gameButtons = <GameButton> [
      GameButton(id:1),
      GameButton(id:2),
      GameButton(id:3),
      GameButton(id:4),
      GameButton(id:5),
      GameButton(id:6),
      GameButton(id:7),
      GameButton(id:8),
      GameButton(id:9)
    ];
    player1 = List(); //Vaciamos los botones que ha tocado el jugador 1
    player2 = List(); //Vaciamos los botones que ha tocado el jugador 2
    return gameButtons;
  }

  
  Widget build(BuildContext context) {
    //TODO: Mejorar la estética de la vista de los botones y pantalla.
    return new Scaffold(
      //AppBar del juego de Ta-te-ti
      appBar: AppBar(
          title: Text("Ta-Te-Ti"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent

      ),

      //Constructor de los botones en una GridView
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 9.0,
          mainAxisSpacing: 9.0
        ),

        //Cantidad de botones
        itemCount: buttonList.length,
        //Constructor de cada botón
        itemBuilder: (context,i) => SizedBox(
          width: 100.0,
          height: 100.0,
          child: new RaisedButton(
            padding: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                    width: 1.0,
                    color:Colors.grey ,
                    style:BorderStyle.solid )
            ),

            //Si el botón ya se presionó, no hacer nada, sino agregar el boton a la
            //Lista del jugador activo.
            onPressed: buttonList[i].enabled ?() => playGame(buttonList[i]):null,

            child: Text(
                buttonList[i].text,
                style: TextStyle(color: Colors.white,fontSize: 20.0),
            ),
            color: buttonList[i].backgroundColor,
            disabledColor: buttonList[i].backgroundColor,
        ) ,

      ),


    ),

      //Color de fondo
      backgroundColor: Colors.white,
      //Barra de Navegación inferior (Reset Game)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.all(0.0),
        height: 45,

        child:  RaisedButton(
          child: Text("Reset Ta-te-ti ? "),
          color: Colors.blue,
          onPressed: () => showDialog(
              context: context,
              builder: (_HomePageState) =>new CustomDialog.type("Reset Ta-te-ti ?","Seguro?",resetGame,"Si",2)
            )
          ),
        ),
      );
  }
}