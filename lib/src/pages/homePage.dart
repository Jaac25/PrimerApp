import 'package:flutter/material.dart';
import 'package:segundacomponents/src/providers/menu_provider.dart';
import 'package:segundacomponents/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ALEGRÍA',
          style: TextStyle(
              fontSize: 25,
              color: Colors.orange
          ),
        ),
        backgroundColor: Colors.yellow,
        leading: Icon(
          Icons.star,
        ),
      ),
      body: _lista(),
      /*ListView(
        children: _itemsList(),
      ),*/
    );
  }
}

Widget _lista(){
  return FutureBuilder(
    future: menuProvider.cargarData(),
    initialData: [],
    builder: ( context,AsyncSnapshot<List<dynamic>> snapshot){
      print('builder');
      print(snapshot.data);
      return ListView(
        children: _itemList(snapshot.data,context),
      );
    }
  );
}

List<Widget> _itemList(List<dynamic> data,BuildContext context) {
  //List<Widget> widgets = new List<Widget>();
  List<Widget> opciones = new List<Widget>();
  data.forEach((opt){
    final widgetTemp = ListTile(
      title: Text(
        opt['texto'],
      ),
      //leading: Icon(Icons.add, color: Colors.orange),
      leading: getIcon(opt['icon']),
      trailing: Icon(Icons.widgets,color:Colors.green),
      onTap: (){
        /*final route = MaterialPageRoute(
          builder: (context) => AlertPage(),
        );
        Navigator.push(context, route);*/
        Navigator.pushNamed(context, opt['ruta']);
      },
    );
    opciones..add(widgetTemp)
            ..add(Divider());
  });
  /*for(int i = 0;i<3;i++) {
    widgets.add(ListTile(
      leading: Icon(Icons.toys),
      title: Text(
        'Primero',
          style: TextStyle(color: Colors.orange),
        ),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {},
    ));
    widgets.add(Divider());
  }
  return widgets;*/
  return opciones;
}