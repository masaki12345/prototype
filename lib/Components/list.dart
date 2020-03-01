import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prototype/Models/col.dart';
import 'package:prototype/Services/processing.dart';

class Lists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Processing().getNotes(),
      builder: (BuildContext context, AsyncSnapshot<List<Col>> snapshot) {
        return Container(
          height: MediaQuery.of(context).size.height - 200.0,
          child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Col col = snapshot.data[index];
                return GestureDetector(
                  onLongPress: () {
                    HapticFeedback.vibrate();

                    // print("a");
                    // Processing.vibrate();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: FractionalOffset.topRight,
                        end: FractionalOffset.bottomRight,
                        colors: [
                          Color.fromRGBO(126, 194, 194, 1),
                          Color.fromRGBO(157, 220, 220, 1),
                          //redColor
                          // Color.fromRGBO(230, 122, 122, 1),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 10.0,
                          offset: Offset(10, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: const ListTile(
                            leading: Icon(Icons.album),
                            title: Text('The Enchanted Nightingale'),
                            subtitle: Text(
                                'Music by Julie Gable. Lyrics by Sidney Stein.'),
                          ),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('BUY TICKETS'),
                              onPressed: () {},
                            ),
                            FlatButton(
                              child: const Text('LISTEN'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
