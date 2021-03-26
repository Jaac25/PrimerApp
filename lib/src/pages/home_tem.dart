import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Lista',
        ),
      ),
      body: ListView(
        children: _crearFilas(),
      ),
    );
  }
  List<Widget> _crearFilas(){
    List<Widget> widgets = new List<Widget>();
    String pal = "a";
    for(int i = 1;i<41;i++){
      if(pal.length == 11){
        if(pal.indexOf('a') == 0){
          pal = 'b';
        }else if(pal.indexOf('b') == 0){
          pal = 'c';
        }else if(pal.indexOf('c') == 0){
          pal = 'd';
        }else{
          print(pal.indexOf('a'));
          print(pal.indexOf('b'));
          print(pal.indexOf('c'));
          print(pal.indexOf('d'));
        }
      }else{
        pal = pal + pal[0];
      }
      widgets.add(
          ListTile(
            title: Text(
              pal,
              style: TextStyle(color: Colors.red),
            ),
            trailing: Text(pal.length.toString()),
          )
      );
    }
    return widgets;
  }
  List<Widget> _filascortas(){
    List<Widget> widgets = new List<Widget>();
  }
}