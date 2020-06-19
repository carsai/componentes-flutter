import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
double _valorSlider = 100;
bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,      
      label: 'Tamaño de la imagen',
      divisions: 20,
      value: _valorSlider, 
      onChanged: (_bloquearCheck) ? null : (valor) {        
        setState(() {
          _valorSlider = valor;          
        });
      },
      min: 10,
      max: 400,
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      value: _bloquearCheck, 
      onChanged: (valor) => setState(() => _bloquearCheck = valor),
      title: Text('Bloquear slider'),
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      value: _bloquearCheck, 
      onChanged: (valor) => setState(() => _bloquearCheck = valor),
      title: Text('Bloquear slider'),
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://img.memecdn.com/kawaii-heavy_fb_3170005.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }


}