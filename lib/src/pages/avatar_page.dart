import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ALEGRÍA Avatar',
          style: TextStyle(color:Colors.orange),
        ),
        backgroundColor: Colors.yellowAccent,
        leading: FloatingActionButton(
          child: Icon(Icons.text_rotation_none,color: Colors.yellow),
          backgroundColor: Colors.orange,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://static.wixstatic.com/media/543ee3_d44a504a3b1747ccb5a31301c0129867~mv2.png/v1/fill/w_290,h_231,al_c,q_85,usm_0.66_1.00_0.01/logoLetra.webp'),
              radius: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('JA'),
              backgroundColor: Colors.greenAccent,
            ),
          ),
        ],
      ),
      body: Center(
        child:FadeInImage(
          placeholder: AssetImage('assets/original.gif'),
          image: NetworkImage('https://static.wixstatic.com/media/543ee3_b3e0cdbb68024e2899101f559f6bde9d~mv2.jpg/v1/fill/w_960,h_499,al_c,q_85,usm_0.66_1.00_0.01/543ee3_b3e0cdbb68024e2899101f559f6bde9d~mv2.webp'),
          fadeOutDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}