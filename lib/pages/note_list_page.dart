import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:pomodoro_tracker/models/note.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  final String firebaseCollectionName = 'notes';
  final String firebaseHeaderAttributeName = 'header';
  final String firebaseMainTextAttributeName = 'mainText';

  late String _header;
  late String _mainText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список записок'), centerTitle: true),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(firebaseCollectionName)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(snapshot.data!.docs[index].id),
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index]
                            .get(firebaseHeaderAttributeName)),
                        trailing: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              Navigator.pushNamed(context, '/note',
                                  arguments: Note(
                                      index,
                                      snapshot.data!.docs[index]
                                          .get(firebaseHeaderAttributeName),
                                      snapshot.data!.docs[index]
                                          .get(firebaseMainTextAttributeName)));
                            }),
                      ),
                    ),
                    onDismissed: (direction) {
                      FirebaseFirestore.instance
                          .collection(firebaseCollectionName)
                          .doc(snapshot.data!.docs[index].id)
                          .delete();
                    },
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Добавление записки'),
                    content: Column(
                      children: [
                        TextField(
                            onChanged: (String value) {
                              _header = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Заголовок',
                            )),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (String value) {
                              _mainText = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Основной текст',
                            ))
                      ],
                    ),
                    actions: [
                      OutlinedButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection(firebaseCollectionName)
                                .add({
                              firebaseHeaderAttributeName: _header,
                              firebaseMainTextAttributeName: _mainText
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('Добавить',
                              style: TextStyle(color: Colors.black)))
                    ],
                  );
                });
          },
          child: const Icon(Icons.add)),
    );
  }
}
