import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp( home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter ButtonBar Example'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: new ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: new Text('Javatpoint'),
                        color: Colors.lightGreen,
                        onPressed: () {/** */},
                      ),
                      FlatButton(
                        child: Text('Flutter'),
                        color: Colors.lightGreen,
                        onPressed: () {/** */},
                      ),
                      FlatButton(
                        child: Text('MySQL'),
                        color: Colors.lightGreen,
                        onPressed: () {/** */},
                      ),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}  