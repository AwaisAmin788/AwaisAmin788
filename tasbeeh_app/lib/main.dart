import 'package:flutter/cupertino.dart';
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
          title: Text('TASBEEH App'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: new ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        splashColor: Colors.red,
                        child: new Text('Create Tasbeeh',
                        style:const TextStyle(color:Colors.black),


                        ),

                        color: Colors.lightBlueAccent,
                        onPressed: () {/** */},
                      ),
                      FlatButton(
                        splashColor: Colors.red,
                        child: Text('Counter Tasbeeh',
                          style:const TextStyle(color:Colors.black),

                        ),
                        color: Colors.lightBlueAccent,
                        onPressed: () {/** */},
                      ),
                      FlatButton(
                        splashColor: Colors.red,
                        child: Text('View All tasbeeh',
                            style:const TextStyle(color:Colors.black),
                        ),
                        color: Colors.lightBlueAccent,
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