import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';  
  String _email = '';
  String _password = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';

  TextEditingController _inputFieldDateController = TextEditingController();

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0
        ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo pon el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
        
      },
    );
  }


 Widget _crearEmail() {
   return TextField(
     keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (value) => setState(() => _email = value)
    );
 }

 Widget _crearPassword() {
   return TextField(
     obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (value) => setState(() => _password = value)
    );
 }

 Widget _crearFecha(BuildContext context) {
   return TextField(      
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
 }

 void _selectDate(BuildContext context) async {
   DateTime picked = await showDatePicker(
     context: context, 
     initialDate: DateTime.now(), 
     firstDate: DateTime(2018), 
     lastDate: DateTime(2025),
     locale: Locale('es', 'ES') 
   );

   if (picked != null) {
     setState(() {
       _fecha = picked.toString();
       _inputFieldDateController.text = _fecha;
     });
   }
 }

 List<DropdownMenuItem<String>> _getOpcionesDropDown() {
   List<DropdownMenuItem<String>> lista = List();

   _poderes.forEach((poder) {
     lista.add(DropdownMenuItem(
       child: Text(poder),
       value: poder,
     ));
   });

   return lista;
 }

 Widget _crearDropDown() {
   return Row(
     children: <Widget>[
       Icon(Icons.select_all),
       SizedBox(width: 30.0),
       Expanded(
        child: DropdownButton(       
          isExpanded: true,  
          value: _opcionSeleccionada,
          items: _getOpcionesDropDown(), 
          onChanged: (opt) {
          setState(() {
            _opcionSeleccionada = opt;
          });
          },
         ),
       ),
     ],
   );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Su nombre es $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text('$_opcionSeleccionada'),
    );
  }
}