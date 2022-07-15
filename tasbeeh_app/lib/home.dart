import 'package:flutter/material.dart';

class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new makeItRainState();
  }

}

class makeItRainState extends State<home> {
  int _tashbehCount = 0;

  void counter() {
    setState(() {
      _tashbehCount = _tashbehCount + 1;
    });
  }
  void refresh(){
    setState(() {
      _tashbehCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tashbeh Counter'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: new Container(
          child : new Column(
            children: <Widget>[
              new Center(
                child: new Text("استغفر الله",

                  style: new TextStyle(fontSize: 30.0,
                      color: Colors.black),),
              ),
              new Expanded(
                  child: new Center(
                    child: new Text('$_tashbehCount',
                      style: new TextStyle(
                          color: _tashbehCount < 50 ? Colors.lightBlueAccent: Colors.red,
                          fontSize: 40.3,
                          fontWeight: FontWeight.w500
                      ),),
                  )),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightBlueAccent,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: counter,
                        child: new Text("+",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  )),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightBlueAccent,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: refresh,
                        child: new Text("Restart",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  )),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightGreen,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: refresh,
                        child: new Text("Save",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  )),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightGreen,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: refresh,
                        child: new Text("Close App",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  )),
            ],
          )

      ),
    );
  }
}