import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prototype/Models/col.dart';
import 'package:prototype/Services/processing.dart';

import 'Add.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size * 0.78;
    final Size heightsize = MediaQuery.of(context).size * 0.2;
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
                height: size.height,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Col col = snapshot.data[index];
                      return Container(
                          margin: EdgeInsets.all(15),
                          height: heightsize.height,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(col.test));
                    }),
              ),
              FloatingActionButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Add(),
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                backgroundColor: Colors.red,
              ),
            ],
          );
        },
      ),
    );
  }
}

// child: ListTile(
//   title: Row(
//     children: <Widget>[
//       Expanded(
//         child: Text(col.test),
//       ),
//     ],
//   ),
//   subtitle: Text(col.samople),
//   trailing: Row(
//     mainAxisSize: MainAxisSize.min,
//     children: <Widget>[
//       IconButton(
//         icon: Icon(Icons.edit),
//         color: Colors.blue,
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => Retouching(
//               col: col,
//             ),
//           ),
//         ),
//       ),
//       IconButton(
//         icon: Icon(Icons.delete),
//         color: Colors.red,
//         onPressed: () =>
//             Processing().deleteNote(col.id),
//       ),
//     ],
//   ),
// ),
