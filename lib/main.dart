import 'dart:io';

import 'package:flutter/material.dart';
import 'blackjack_logic.dart';
void main() {
  runApp(const MaterialApp(
    home: Home(),

  )
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        title: const Text("Blackjack with friends"),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: Row(

        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(color: Colors.green,),

          ),
          Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context)=>const Game())
                          );
                        },
                        child: Text("Start")
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context)=>const SettingsMenu())
                          );
                        },
                        child: Text("Settings")
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (){
                        exit(0);
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red[500]
                      ),
                      child: Text("EXIT"),

                    ),
                  ),

                ],
              )

          ),
          Expanded(
            flex: 2,
            child: Container(color: Colors.green,),

          ),

        ],
      ),
    );




  }


}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  _GameState createState() => _GameState();

}

class _GameState extends State<Game> {
  late BlackjackGame _blackjackGame;

  @override
  void initState() {
    super.initState();
    _blackjackGame = BlackjackGame();
    _blackjackGame.startGame();
  }

  void _playerHit() {
    setState(() {
      _blackjackGame.playerHit();
    });
  }

  void _dealerHit() {
    setState(() {
      _blackjackGame.dealerHit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blackjack Game"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: "Go back",
            icon: const Icon(Icons.keyboard_backspace),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Player's Hand: ${_blackjackGame.playerHand.map((card) => card.rank).join(', ')}"),
            Text("Dealer's Hand: ${_blackjackGame.dealerHand.map((card) => card.rank).join(', ')}"),
            Text("Outcome: ${_blackjackGame.checkOutcome()}"),
            ElevatedButton(
              onPressed: _playerHit,
              child: Text("Hit"),
            ),
            ElevatedButton(
              onPressed: _dealerHit,
              child: Text("Stand"),
            ),
          ],
        ),
      ),
    );
  }
}
class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello settings"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_backspace)),
        ],
      ),
    );
  }

}
