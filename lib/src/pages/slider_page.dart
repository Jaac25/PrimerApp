import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget{
  _SliderPageState createState() => _SliderPageState();
}
class _SliderPageState extends State<SliderPage>{
  double _valorSlider = 30;
  bool _opcion = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ALEGRÍA',
          style: TextStyle(color:Colors.orange),
        ),
        leading: Icon(Icons.arrow_back,color: Colors.orange,),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        padding: EdgeInsets.only(top:50),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBoxLT(),
            _crearSwitch(),
            _crearImagen(),
          ],
        ),
      ),
    );
  }
  Widget _crearSlider(){
    return Slider(
      value: _valorSlider,
      min: 0,
      max: 35,
      onChanged: (_opcion) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
      activeColor: Colors.orange,
      inactiveColor: Colors.yellow,
      label: 'Tamaño de la imagen',
      //divisions: 10,
    );
  }
  Widget _crearImagen(){
    return Expanded(
      child: FadeInImage(
        placeholder: AssetImage('assets/original.gif'),
        image: NetworkImage('https://static.wixstatic.com/media/543ee3_96f7ee002f01450dbd439d34ead2086b~mv2.png/v1/fill/w_960,h_499,al_c,q_90,usm_0.66_1.00_0.01/543ee3_96f7ee002f01450dbd439d34ead2086b~mv2.webp'),
        fadeInDuration: Duration(milliseconds: 200),
        width: _valorSlider*10,
        fit: BoxFit.contain,
      ),
    );
  }
  Widget _checkBox(){
    return Checkbox(
      value: _opcion,
      activeColor: Colors.orange,
      checkColor: Colors.yellow,
      onChanged: (valor){
        setState(() {
          _opcion = valor;
        });
      },
    );
  }
  Widget _checkBoxLT(){
    return CheckboxListTile(
      title: Text(
        'Bloquear imagen',
      ),
      value: _opcion,
      activeColor: Colors.orange,
      checkColor: Colors.yellow,
      onChanged: (valor){
        setState(() {
          _opcion = valor;
        });
      },
    );
  }
  Widget _crearSwitch(){
    return SwitchListTile(
      title: Text(
        'Bloquear imagen',
      ),
      value: _opcion,
      activeColor: Colors.orange,
      inactiveThumbColor: Colors.yellow,
      //checkColor: Colors.yellow,
      //focusColor: Colors.green,
      onChanged: (valor){
        setState(() {
          _opcion = valor;
        });
      },
    );
  }
}