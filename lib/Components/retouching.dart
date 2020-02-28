import 'package:flutter/material.dart';
import 'package:prototype/Models/col.dart';
import 'package:prototype/Services/processing.dart';

class Retouching extends StatefulWidget {
  final Col col;

  const Retouching({this.col});
  @override
  _RetouchingState createState() => _RetouchingState();
}

class _RetouchingState extends State<Retouching> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _testController;
  TextEditingController _samopleController;

  @override
  void initState() {
    super.initState();
    _testController = TextEditingController(text: widget.col.test);
    _samopleController = TextEditingController(text: widget.col.samople);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('修正'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _testController,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'title not empty';
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _samopleController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  child: Text('save'),
                  onPressed: () async {
                    if (_key.currentState.validate()) {
                      try {
                        await Processing().updateData(
                          widget.col.id,
                          Col(
                              test: _testController.text,
                              samople: _samopleController.text),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
