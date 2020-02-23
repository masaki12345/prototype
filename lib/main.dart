import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(context),
    );
  }

  Stream getStreamSnapshots(String collection) {
    return Firestore.instance
        .collection('testdata')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
      stream: getStreamSnapshots("testdata"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        return new ListView(
          children: snapshot.data.documents.map<Widget>((dynamic document) {
            return new ListTile(
              title: new Text(document['test']),
              subtitle: new Text(document['samople']),
            );
          }).toList(),
        );
      },
    );
  }
}
