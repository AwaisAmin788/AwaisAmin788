import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget> [
          Expanded(child:Row(
            children: <Widget>[
              Expanded(child:RepeatContainerCode(
                colors: Color(0xFF1D1E33),
                cardWidget: Column(
                  children: <widget>[
                    Icon(FontAwesomeIcons.male,
                      size: 80.0,,
                    ),
                    SizeBox(
                      height:15.0,
                    ),
                  ],

                ),
              ),),
              Expanded(child:RepeatContainerCode(
                colors: Color(0xFF1D1E33),
              ),),

            ],
          ),),
          Expanded(child:RepeatContainerCode(
            colors: Color(0xFF1D1E33),
          ),),
          Expanded(child: Row(
          children: <Widget>[
          Expanded(child:RepeatContainerCode(
            colors: Color(0xFF1D1E33),
          ),),
          Expanded(child:RepeatContainerCode(
            colors: Color(0xFF1D1E33),
          ),
          ),

        ],
      ),),

        ],
      ),

    );
  }
}

class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({@required this.colors,this.cardWidget});
  final Color? colors;
  final Widget cardWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: cardWidget,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}