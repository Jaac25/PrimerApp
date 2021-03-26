import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedPageContainer extends StatefulWidget{
  @override
  _AnimatePageState createState() => _AnimatePageState();
}
class _AnimatePageState extends State<AnimatedPageContainer>{
  double _width = 50;
  double _height = 50;
  Color _color = Colors.yellow;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  double _num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ALEGRÍA',
          style: TextStyle(color:Colors.orange),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BorderCircular\n$_num',
                    style: TextStyle(fontSize:20,color:_color),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'width\n$_width',
                    style: TextStyle(fontSize:20,color:_color),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'height\n$_height',
                    style: TextStyle(fontSize:20,color:_color),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ),
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                  borderRadius: _borderRadius,
                  color: _color,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      spreadRadius: 10,
                      blurRadius: 30,
                      color: _color,
                    )
                  ]
              ),
              duration: Duration(seconds: 5),
              curve: Curves.fastOutSlowIn,
            ),
            SizedBox(
              height: 200,
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.airplanemode_active,color: Colors.orange),
        backgroundColor: Colors.yellow,
        onPressed: _cambiarForma,
      ),
    );
  }
  void _cambiarForma(){
    final random = Random();
    int num1 = random.nextInt(300);
    int num2 = random.nextInt(300);
    int num3 = random.nextInt(100);
    _num = random.nextInt(100).toDouble();
    setState(() {
      _width = num1.toDouble();
      _height = num2+0.0;
      _color = Color.fromRGBO(num3,num1,num2,1);
      _borderRadius = BorderRadius.circular(_num);
    });
  }
}