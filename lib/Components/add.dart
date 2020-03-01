import 'package:flutter/material.dart';
import 'package:prototype/Models/col.dart';
import 'package:prototype/Services/processing.dart';

class Add extends StatefulWidget {
  final Col col;

  const Add({this.col});
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _testController;
  TextEditingController _samopleController;
  String _type = '';
//初期化
  @override
  void initState() {
    super.initState();
    _testController = TextEditingController();
    _samopleController = TextEditingController();
  }

  void _handleRadio(String e) => setState(() {
        _type = e;
        print(_type);
      });

//破棄
  @override
  void dispose() {
    _testController.dispose();
    _samopleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('追加'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RadioListTile(
                  activeColor: Colors.blue,
                  title: Text('CSS'),
                  value: "CSS",
                  groupValue: _type,
                  onChanged: _handleRadio,
                ),
                RadioListTile(
                  title: Text('JavaScript'),
                  value: "JavaScript",
                  groupValue: _type,
                  onChanged: _handleRadio,
                ),
                RadioListTile(
                  title: Text('HTML'),
                  value: "HTML",
                  groupValue: _type,
                  onChanged: _handleRadio,
                ),
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
                        await Processing().addNote(
                          Col(
                              test: _testController.text,
                              samople: _samopleController.text,
                              category: _type),
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
