import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Mainpage(),));
}
class Mainpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            color: Colors.blueAccent,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                height: 150,
                minWidth: 150,
                child: Text("START"),
                shape: CircleBorder(),
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder:(context) => Gamepage()));
                }
              
              ),
            )
          ),

          Container(
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            color: Colors.redAccent,
            child:Center(
               child: MaterialButton(
              color:Colors.white,
              shape: CircleBorder(),
              height: 150,
              minWidth: 150,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Gamepage()));
              },
              child: Text("START"),
            ),
            )
           
          ),
        ],
      ),
    );
  }
}
class Gamepage extends StatefulWidget{
  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  double blueCardHeight = 0;

  double redCardHeight = 0;
  int playerAScore = 0;
  int playerBScore = 0;

  bool initialized = false;

  @override
  Widget build(BuildContext context) {

    print("BUILD FUNCTION CALLED");
    print(initialized);

    if(initialized == false){
      blueCardHeight = MediaQuery.of(context).size.height/2;
      redCardHeight = MediaQuery.of(context).size.height/2;

      initialized = true;
    }
    
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print(blueCardHeight);

              
              setState((){
                blueCardHeight = blueCardHeight + 30;
                redCardHeight = redCardHeight - 30;
                playerBScore = playerBScore + 5;
              });
              double winningHeight = MediaQuery.of(context).size.height-60;

              print(blueCardHeight);
              print(winningHeight);

              if(blueCardHeight > winningHeight){
                Navigator.push(context,
                 MaterialPageRoute(builder:(context)=>ResultPage(playerBScore,"b")));
              }
              
            },
            padding: EdgeInsets.zero,
            child: Container(
              height: blueCardHeight,
              width: double.infinity,
              color: Colors.blueAccent,
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Expanded(
                    child:Text(
                      "Player B",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                  ),
                  Text(playerBScore.toString(),
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
                ],
              )
              
              ),
          ),
          
          MaterialButton(
            onPressed: () {
              setState(() {
                redCardHeight = redCardHeight + 30;
                blueCardHeight = blueCardHeight - 30;
                playerAScore = playerAScore + 5;
              }
              );  
              double screenHeight = MediaQuery.of(context).size.height;
              double winningHeight = MediaQuery.of(context).size.height-60;

              print(redCardHeight);
              print(winningHeight);

              if(redCardHeight > winningHeight){
                Navigator.push(context,
                 MaterialPageRoute(builder:(context)=>ResultPage(playerAScore,"a")));
              }
            },
            padding: EdgeInsets.all(0),
            child: Container(
              height: redCardHeight,
              width: double.infinity,
              color: Colors.redAccent,
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                    child:Text(
                      "Player A",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                  ),
                  Text(
                    playerBScore.toString(),
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
                ],
              )
              
              ),
          ),
          
        ],
      ),
      );
  }
}  

class ResultPage extends StatelessWidget{

  int score = 0;
  String player = "";
  ResultPage(this.score, this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: player == "a" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score.toString(),
            style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
            Text(player == "a" ? "PLAYER A WON" : "PLAYER B WON",
             style: TextStyle(fontSize: 35),),
            MaterialButton(
              onPressed:(){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            color: Colors.white,
            child: Text("Restart Game",style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}