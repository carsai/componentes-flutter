import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://s1.eestatic.com/2019/04/16/como/Mascotas-Ninos-Remedios_caseros-Perros-Gatos-Alimentacion-Animales-Agua-Tierra-Como_hacer_391471590_120559780_1706x960.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 10.0
            ),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/original.gif'), 
          image: NetworkImage('https://misanimales.com/wp-content/uploads/2018/01/especies-hamster-sirio-dorado.jpg'),
          fadeInDuration: Duration(
            milliseconds: 200
          ),
        ),
      ),
    );
  }
}