import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget{
  _ListPageState createState() => _ListPageState();
}
class _ListPageState extends State<ListPage>{
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarDiez();
    _scrollController.addListener((){
      //print('Scroll!!');
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregarDiez();
        _fetchData();

        //print(_listaNumeros.length);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ALEGRÍA',style: TextStyle(color:Colors.orange)),
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color:Colors.orange,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          crearLoading(),

        ],
      ),
    );
  }
  Widget _crearLista(){
    return RefreshIndicator(
      onRefresh: obtenerPageWeb,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context,int index){
          final _imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            //image: NetworkImage('https://static.wixstatic.com/media/543ee3_27334c3879b14983bc463f9f9b7fe461~mv2.jpg/v1/fill/w_784,h_594,al_c,q_90,usm_0.66_1.00_0.01/543ee3_27334c3879b14983bc463f9f9b7fe461~mv2.webp'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$_imagen'),
          );
        }
      ),
    );
  }
  Future<void> obtenerPageWeb() async{
    final duration = new Duration(seconds: 2 );
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarDiez();
    });
    return Future.delayed(duration);
  }
  Widget _agregarDiez(){
    for(int i = 0;i<10;i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      setState(() {});
    }
  }
  Future<Null> _fetchData() async{
    _isLoading = true;
    setState(() {

    });
    new Timer(Duration(seconds: 2), respuestaHTTP);
  }
  void respuestaHTTP(){
    _isLoading = false;
    _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn);
    _agregarDiez();
  }
  Widget crearLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15,)
        ],
      );
    }else{
      return Container();
    }
  }
}