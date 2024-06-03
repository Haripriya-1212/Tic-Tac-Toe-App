import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colours.dart';

class game extends StatefulWidget{
  @override
    @override
    State<StatefulWidget> createState() => _gameScreen();
  }


class _gameScreen extends State<game>{
  List <String> displayXO = [" "," "," "," "," "," "," "," "," "];
  String result = " ";
  bool oTurn = true;
  bool winnerFound = false;
  int filledBoxes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("TicTacToe"),
      // ),
      backgroundColor: colours.bgcolour,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(child: Text("Score Board"))),

            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                itemBuilder: (BuildContext context, int index ){
                  return GestureDetector(
                    onTap:(){tapped(index);},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(),
                          color: colours.tilescolour,
                        ),
                        child: Center(child: 
                        Text(
                          displayXO[index],
                          style: TextStyle(fontSize: 30),),
                        
                        ),
                      ),
                    ),
                  );
                  
                }
              )
            ),

            Expanded(
              flex: 1,
              child: Text(result, 
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500,color: colours.tilescolour),
              )),
          ],),
      )
    );
  }
  void tapped(int index) {
    setState(() {
      if(oTurn && displayXO[index]==" "){
        displayXO[index] = "O";
        filledBoxes ++;
      }
      else if(!oTurn && displayXO[index]==" "){
        displayXO[index] = "X";  
        filledBoxes ++;
      }  
      oTurn = !oTurn;  
      checkWinner(); 
    });
  }

  void checkWinner() {
    if(displayXO[0] == displayXO[1] && displayXO[1] == displayXO[2] && displayXO[0] != " "){
      setState(() {
        result = "Player " + displayXO[0] + " wins";
        winnerFound = true;
      });
    }
    if(displayXO[3] == displayXO[4] && displayXO[4] == displayXO[5] && displayXO[3] != " "){
      setState(() {
        result = "Player " + displayXO[3] + " wins";
        winnerFound = true;
      });
    }
    if(displayXO[6] == displayXO[7] && displayXO[7] == displayXO[8] && displayXO[6] != " "){
      setState(() {
        result = "Player " + displayXO[6] + " wins";
        winnerFound = true;
      });
    }

    if(displayXO[0] == displayXO[3] && displayXO[3] == displayXO[6] && displayXO[0] != " "){
      setState(() {
        result = "Player " + displayXO[0] + " wins";
        winnerFound = true;
      });
    }
    if(displayXO[1] == displayXO[4] && displayXO[4] == displayXO[7] && displayXO[1] != " "){
      setState(() {
        result = "Player " + displayXO[1] + " wins";
        winnerFound = true;
      });
    }
    if(displayXO[2] == displayXO[5] && displayXO[5] == displayXO[8] && displayXO[2] != " "){
      setState(() {
        result = "Player " + displayXO[2] + " wins";
        winnerFound = true;
      });
    }

    if(displayXO[0] == displayXO[4] && displayXO[4] == displayXO[8] && displayXO[0] != " "){
      setState(() {
        result = "Player " + displayXO[0] + " wins";
        winnerFound = true;
      });
    }
    if(displayXO[2] == displayXO[4] && displayXO[4] == displayXO[6] && displayXO[2] != " "){
      setState(() {
        result = "Player " + displayXO[2] + " wins";
        winnerFound = true;
      });
    }
    if(!winnerFound && filledBoxes == 9){
      setState(() {  
        result = "Nobody wins";
      });
    }
  }
}




