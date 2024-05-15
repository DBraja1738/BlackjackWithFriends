import 'dart:io';

import 'package:flutter/material.dart';

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

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Game"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: "Go back",
              icon: const Icon(Icons.keyboard_backspace))
        ],
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
