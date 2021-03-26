import 'package:flutter/material.dart';

class CardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ALEGRÍA',
          style: TextStyle(color:Colors.orange),
        ),
        leading: Icon(Icons.android),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: _items(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}

List<Widget> _items() {
  List<Widget> list = new List<Widget>();
  for(int i = 0;i<3;i++){
    list..add(_cardItem1())
        ..add(SizedBox(width: 30,height: 10,))
        ..add(_cardItem2())
        ..add(SizedBox(width: 30,height: 10,))
        ..add(_cardItem1())
        ..add(SizedBox(width: 30,height: 10,))
        ..add(_cardItemBT())
        ..add(SizedBox(width: 30,height: 10,));
  }
  return list;
}

Widget _cardItem1 (){
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    color: Colors.orange,
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album,color:Colors.blue),
          title: Text(
            'Soy de ALEGRÍA'
          ),
          subtitle: Text(
            'Descripción: Tienda especializada en jugos...',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text(
                'yea',
                style: TextStyle(color:Colors.orange),
              ),
              color: Colors.yellow,
              onPressed: (){

              },
            ),
            FlatButton(
              child: Text(
                'cancelar',
                style: TextStyle(color:Colors.orange),
              ),
              color: Colors.yellow,
              onPressed: (){
              },
            )
          ],
        ),
      ],
    ),
  );
}

Widget _cardItem2 (){
  final card = new Container(
    //elevation: 10,
    child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage('https://static.wixstatic.com/media/543ee3_d44a504a3b1747ccb5a31301c0129867~mv2.png/v1/fill/w_290,h_231,al_c,q_85,usm_0.66_1.00_0.01/logoLetra.webp'),
          placeholder: AssetImage('assets/original.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          //height: 300,
          //fit: BoxFit.cover,
        ),
        /*Image(
          image: NetworkImage('https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
        ),*/

        Container(
          //padding: EdgeInsets.symmetric(vertical: 20)
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'ALEGRÍA',
                style: TextStyle(fontSize:20,fontStyle: FontStyle.italic),
              ),
              FlatButton(
                child: Icon(Icons.remove_red_eye, color:Colors.orange),
                onPressed: (){},
              )
            ],
          )
        )
      ],

    ),
  );
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: Colors.yellow,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.orange,
          blurRadius: 10,
          spreadRadius: 2,
          //offset:
        )
      ]
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: card,
    ),
  );
}
Widget _cardItemBT (){
  final card = new Container(
    //elevation: 10,
    child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage('https://media-cdn.tripadvisor.com/media/photo-s/16/41/48/63/nuestro-logo.jpg'),
          placeholder: AssetImage('assets/original.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          //height: 300,
          //fit: BoxFit.cover,
        ),
        /*Image(
          image: NetworkImage('https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
        ),*/
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'El Bosque Tradicional',
                  style: TextStyle(fontSize:20,fontStyle: FontStyle.italic),
                ),
                FlatButton(
                  child: Icon(Icons.remove_red_eye, color:Colors.orange),
                  onPressed: (){},
                )
              ],
            )
        )
      ],
    ),
  );
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.yellow,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.orange,
            blurRadius: 10,
            spreadRadius: 2,
            //offset:
          )
        ]
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: card,
    ),
  );
}