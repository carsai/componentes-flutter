import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() { 
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchData();
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
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
        onRefresh: _obtenerPaginaUno,
        child: ListView.builder(      
          controller: _scrollController,      
          itemCount: _listaNumeros.length,
          itemBuilder: (context, index) {
            final imagen = _listaNumeros[index];

            return FadeInImage(
              placeholder: AssetImage('assets/original.gif'), 
              image: NetworkImage('https://picsum.photos/500/300?random=$imagen'),
              /*fit: BoxFit.contain,
              width: 500,
              height: 300,*/
            );
          },
      ),
    );
  }

  Future<void> _obtenerPaginaUno() {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {
      
    });
  }

  Future<void> _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);


    return Timer(duration, _respuestaHTTP);
  }

  void _respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn
    );

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 20,)
        ],
      );
    } else {
      return Container();
    }
  }

}