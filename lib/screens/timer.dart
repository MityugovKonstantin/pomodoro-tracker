import 'package:flutter/material.dart';
import 'package:pomodoro_tracker/screens/main.dart';

class TimerScreen extends StatelessWidget {
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
            Flexible(
                flex: 4,
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 160, bottom: 160, left: 40, right: 40),
                      child: TimeChooseContainer(),
                    ))),
            Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 175,
                            alignment: Alignment.center,
                            // color: Colors.red,
                            child: ElevatedButton(
                                child: const Text("Start",
                                    style: TextStyle(fontSize: 20)),
                                onPressed: () {
                                  print("Start");
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
                                  child: const Text("Back",
                                      style: TextStyle(fontSize: 22)),
                                  onPressed: () {
                                    print("Back upping");
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => MainScreen()));
                                    print("Finished back up");
                                  }) //BoxDecoration
                              ), //Container
                        )
                      ],
                    )))
          ],
        ),
      ),
    ));
  }
}

class TimeChooseContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Flexible(flex: 1, child: Container(color: Colors.white)),
                  Flexible(flex: 1, child: Container(color: Colors.yellow)),
                  Flexible(flex: 1, child: Container(color: Colors.blue))
                ],
              )),
          Flexible(
              flex: 9,
              child: Row(
                children: <Widget>[
                  Flexible(flex: 1, child: Container(color: Colors.yellow)),
                  Flexible(flex: 1, child: Container(color: Colors.blue)),
                  Flexible(flex: 1, child: Container(color: Colors.white))
                ],
              )),
        ],
      ),
    );
  }
}
