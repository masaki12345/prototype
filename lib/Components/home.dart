import 'package:flutter/material.dart';
import 'package:prototype/Models/col.dart';
import 'package:prototype/Services/processing.dart';

import 'add.dart';

class Home extends StatelessWidget {
  final _titleController = TextEditingController();
  // final _samopleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter List"),
      ),
      body: StreamBuilder(
        stream: Processing().getNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Col>> snapshot) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 200,
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
