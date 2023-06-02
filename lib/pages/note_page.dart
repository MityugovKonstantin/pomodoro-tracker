import 'package:flutter/material.dart';
import 'package:pomodoro_tracker/models/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Note;
    final header = args.header;
    final mainText = args.mainText;

    return Scaffold(
        appBar: AppBar(
          title: Text('Записка'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                  initialValue: header,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Заголовок',
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              TextFormField(
                keyboardType: TextInputType.multiline,
                  initialValue: mainText,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Основной текст',
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              OutlinedButton(onPressed: () {
                FirebaseFirestore.instance.collection('notes').
              }, child: const Text('Сохранить'))
            ],
          ),
        )));
  }
}
