import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 175,
                        alignment: Alignment.center,
                        // color: Colors.red,
                        child: ElevatedButton(
                            child: const Text("Pomodoro",
                                style: TextStyle(fontSize: 20)),
                            onPressed: () {
                              print("Pomodoro!!!");
                            }),
                      ),
                    ),
                    Flexible(flex: 1, child: Container()),
                    Flexible(
                      flex: 1,
                      child: Container(
                          height: 175,
                          alignment: Alignment.center,
                          // color: Colors.red,
                          child: ElevatedButton(
                              child: const Text("Notes",
                                  style: TextStyle(fontSize: 22)),
                              onPressed: () {
                                print("Notes!!!");
                              }) //BoxDecoration
                      ), //Container
                    )
                  ],
                ),
                Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.blue,
                      child: ElevatedButton(
                          child:
                          const Text("Start", style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            print("Start!!!");
                          }),
                    ))
              ],
            ),
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(home: MainScreen()));
}

