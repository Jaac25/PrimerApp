import 'package:flutter/material.dart';
import 'package:segundacomponents/src/pages/homePage.dart';

class AlertPage extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alert Page',
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'BOOM',
            //style: TextStyle(color:Colors.yellow),
          ),
          color: Colors.orange,
          elevation: 10,
          textTheme: ButtonTextTheme.accent,
          textColor: Colors.yellow,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done_outline),
        onPressed: (){
          final route = MaterialPageRoute(
            builder: (context){
              return HomePage();
            }
          );
          //Navigator.push(context, route);
          Navigator.pop(context);
        },
      ),
    );
  }
  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder:(context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          title: Text(
            'Alerta!!!',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InputChip(
                label: Text(''),
                backgroundColor: Colors.yellow,
                onPressed: (){

                },
              ),
              Text(
               'Ahora sí explotará!!!'
              ),
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
              color: Colors.red,
              textColor: Colors.yellow,
            ),
            RaisedButton(
              child: Text('Prueba'),
              onPressed: (){},
              color: Colors.orange,
              textColor: Colors.yellow,
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pop();
              },
              color: Colors.green,
            ),
          ],
        );
      }
    );
  }
}