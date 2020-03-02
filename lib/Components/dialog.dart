import 'package:flutter/material.dart';
import 'package:prototype/Models/col.dart';
import 'package:prototype/Services/processing.dart';

class Dialogss extends StatefulWidget {
  @override
  _DialogssState createState() => _DialogssState();
}

class _DialogssState extends State<Dialogss> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _colorController;
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _colorController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('リッチなポップアップ'),
      onPressed: () {
        showRichPopup(context);
      },
    );
  }

  void showRichPopup(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierLabel: 'Dismiss',
        barrierColor: Colors.black.withOpacity(0.5),
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 200),
        transitionBuilder: (_, animation, __, child) {
          return ScaleTransition(
            alignment: Alignment.center,
            scale: animation,
            child: child,
          );
        },
        pageBuilder: (context, _, __) {
          final size = MediaQuery.of(context).size;

          return Center(
            child: SizedBox(
              height: size.height * 0.7,
              width: size.width * 0.8,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _colorController,
                      decoration: InputDecoration(
                        labelText: 'title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: _nameController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: 'description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                        textAlign: TextAlign.left,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Processing().addcategory(
                          Col(
                            category_color: _colorController.text,
                            category_name: _nameController.text,
                          ),
                        );
                        // print(_testController.text + _samopleController.text);
                        Navigator.pop(context);
                      },
                      color: Colors.blue,
                      shape: StadiumBorder(),
                      child: Text(
                        'aaa',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
