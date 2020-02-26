import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prototype/processing.dart';

import 'add.dart';
import 'col.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _titleController = TextEditingController();
  final _samopleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("でも"),
      ),
      body: StreamBuilder(
        stream: Processing().getNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Col>> snapshot) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 600,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Col col = snapshot.data[index];
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black38),
                          ),
                        ),
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(col.test),
                              ),
                            ],
                          ),
                          subtitle: Text(col.samople),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.black,
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AddNote(
                                      col: col,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.blue,
                                onPressed: () =>
                                    Processing().deleteNote(col.id),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        _titleController.clear();
                        return AlertDialog(
                          title: Text("追加してね"),
                          content: TextField(
                            controller: _titleController,
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "閉じる",
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text(
                                "登録",
                              ),
                              onPressed: () {
                                Processing().addNote(
                                  Col(
                                    test: _titleController.text,
                                    samople: "_titleController",
                                  ),
                                );
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
