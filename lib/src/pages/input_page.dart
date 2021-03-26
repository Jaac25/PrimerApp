import 'package:flutter/material.dart';

class InputPage extends StatefulWidget{
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage>{
  String _entrad = '';
  String _email = '';
  String _password = '';
  String _opcionSelect = 'Volar';

  List<String> _poderes = ['Volar','Rayos X','Super Aliento'];

  TextEditingController _inputOne = new TextEditingController();

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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        children: <Widget>[
          _crearEntrada(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }
  Widget _crearEntrada (){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        counter: Text('Letras: ${_entrad.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo el nombee',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
          _entrad = valor;
        });
      },
    );
  }
  Widget _crearPersona(){
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Text('Nombre es: $_entrad',),
        SizedBox(height: 20),
        Text('Email: $_email'),
        SizedBox(height: 20),
        Text('Password: $_password'),
        SizedBox(height: 20),
        Text('Poder: $_opcionSelect')
      ],
    );
  }
  Widget _crearEmail(){
    return TextField(
      //textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          //counter: Text('Letras: ${_entrad.length}'),
          hintText: 'Email de la persona',
          labelText: 'Email',
          //helperText: 'Solo el nombee',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );
  }
  Widget _crearPassword(){
    return TextField(
      //textCapitalization: TextCapitalization.sentences,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          //counter: Text('Letras: ${_entrad.length}'),
          hintText: 'Password de la persona',
          labelText: 'Password',
          //helperText: 'Solo el nombee',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)
      ),
      onChanged: (valor){
        setState(() {
          _password = valor;
        });
      },
    );
  }
  Widget _crearFecha(BuildContext context){
    return TextField(
      controller: _inputOne,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Fecha:',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }
  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: Locale('es','ES'),
    );
    if(picked != null){
      setState(() {
        _inputOne.text = picked.toString();
      });
    }
  }

  Widget _crearDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30),
        Expanded(
          child: DropdownButton(
            value: _opcionSelect,
            items: _getOpciones(),
            onChanged: (value) {
              setState(() {
                _opcionSelect = value;
              });
            },
          ),
        ),
      ],
    );
  }
  List<DropdownMenuItem<String>> _getOpciones(){
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder){
      if(poder != null){
        lista.add(DropdownMenuItem(
          value: poder,
          child: Text(poder),
        ));
      }
    });
    return lista;
  }
}