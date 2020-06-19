import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final _opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        // children: _crearItems(),
        children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = List<Widget>();

    for (String opt in _opciones) {
      final tempWidget = ListTile(
        title: Text(opt)
      );
      
      lista..add(tempWidget)
           ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    var widgets = _opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            subtitle: Text('data'),
            title: Text(item + '!'),
            leading: Icon(Icons.account_balance),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              
            },
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }

  List<Widget> _crearItemsCorta2() =>
    _opciones.map((item) =>
      Column(
        children: <Widget>[
          ListTile(
            subtitle: Text('data'),
            title: Text(item + '!'),
          ),
          Divider()
        ],
      )
    ).toList();
}