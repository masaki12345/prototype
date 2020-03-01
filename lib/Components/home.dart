import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Add.dart';
import 'bottom.dart';
import 'list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size * 0.8;
    final Size heightsize = MediaQuery.of(context).size * 0.2;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 244, 225, 1),
      appBar: AppBar(
        title: Text("Flutter List"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 50.0,
        width: double.infinity,
        child: Lists(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Add(),
          ),
        ),
        backgroundColor: Color.fromRGBO(230, 122, 122, 1),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
