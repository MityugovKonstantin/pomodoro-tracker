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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
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
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: const Text("hours"),
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.yellow,
                        alignment: Alignment.center,
                        child: const Text("minutes"),
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: const Text("seconds"),
                      ))
                ],
              )),
          Flexible(
              flex: 9,
              child: Row(
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      child:
                          Container(color: Colors.yellow, child: HoursList())),
                  Flexible(
                      flex: 1,
                      child:
                          Container(color: Colors.blue, child: MinutesList())),
                  Flexible(
                      flex: 1,
                      child:
                          Container(color: Colors.white, child: SecondsList()))
                ],
              )),
        ],
      ),
    );
  }
}

class HoursList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (int i = 1; i <= 24; i++)
              GestureDetector(
                  child: Container(
                    height: 80,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text(i.toString()),
                  ),
                  onTap: () {
                    print("Hour: " + i.toString());
                  }),
          ],
        ),
      ),
    );
  }
}

class MinutesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (int i = 1; i <= 60; i++)
              GestureDetector(
                  child: Container(
                    height: 80,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text(i.toString()),
                  ),
                  onTap: () {
                    print("Minute: " + i.toString());
                  }),
          ],
        ),
      ),
    );
  }
}

class SecondsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (int i = 1; i <= 60; i++)
              GestureDetector(
                  child: Container(
                    height: 80,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text(i.toString()),
                  ),
                  onTap: () {
                    print("Second: " + i.toString());
                  }),
          ],
        ),
      ),
    );
  }
}
