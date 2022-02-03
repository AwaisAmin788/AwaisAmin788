import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('My Profile'),),
        backgroundColor: Colors.black38,


        body: SafeArea(

          child: Column(mainAxisAlignment: MainAxisAlignment.center,


            children: [
              CircleAvatar(
                backgroundImage:AssetImage('image/aaa.png'),
                backgroundColor: Colors.white,
                radius: 55.0,


              ),
              Text(
                'Awais Amin',
                style: TextStyle(
                    color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize:30.0
                ),

              ),
              Text('Flutter Developer',
              style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 17.0
              ),),
              Card(color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+923066544681',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              Card(color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'awaisamin696@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),

                    ),
                  )),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Project",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600
                              ),),
                            SizedBox(
                              height: 7,
                            ),
                            Text("15",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300
                              ),)
                          ],
                        ),
                      ),
                      Expanded(
                        child:
                        Column(
                          children: [
                            Text("Followers",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600
                              ),),
                            SizedBox(
                              height: 7,
                            ),
                            Text("1.3K",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300
                              ),),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text("About Me", style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold)),
                subtitle: Text("Hello! My name is Awais Amin.I've just join the Flutter Development.Basically I am student of BSCS at COMSATS University Islamabad,Vehari Campus.", style: TextStyle(fontSize: 17,fontWeight: FontWeight.w100)),
              ),


                ],



              ),


              ),

          ),


    );
  }
}
