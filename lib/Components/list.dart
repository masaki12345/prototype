import 'dart:ui';

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

                    print("a");
                    // Processing.vibrate();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
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
                        Align(
                            alignment: Alignment.topLeft, child: todoType(col)),
                        const SizedBox(height: 10.0),
                        Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            col.test,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          child: Text(
                            col.samople,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.edit),
                        //   color: Colors.blue,
                        //   onPressed: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (_) => Retouching(
                        //         col: col,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // IconButton(
                        //   icon: Icon(Icons.delete),
                        //   color: Colors.red,
                        //   onPressed: () => Processing().deleteNote(col.id),
                        // ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }

  Widget todoType(Col col) {
    Color colorval;
    String category;
    switch (col.category) {
      case 'CSS':
        category = "CSS";
        colorval = Color(0xff4158ba);
        break;
      case 'JavaScript':
        category = "JavaScript";
        colorval = Color(0xfffb537f);
        break;
      case 'HTML':
        category = "HTML";
        colorval = Color(0xff4caf50);
        break;
      case 'e':
        category = "e";
        colorval = Color(0xff9962d0);
        break;
      default:
        category = "その他";
        colorval = Color(0xff0dc8f5);
      //
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
      decoration: BoxDecoration(
        color: colorval,
        border: Border.all(
          color: colorval,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        category,
        style: TextStyle(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
