import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Главная страница')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/pomodoro');
                  },
                  child: const Text('Помодоро')),
              Container(),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/note_list');
                  },
                  child: const Text('Записи')),
            ],
          ),
          Container(
              alignment: Alignment.center,
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/timer');
                  },
                  child: const Text('Действуй')))
        ],
      ),
    );
  }
}
