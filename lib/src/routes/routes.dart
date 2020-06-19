import 'package:flutter/material.dart';

import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/animate_container.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() => 
<String, WidgetBuilder>{
      '/'                 : (context) => HomePage(),
      'alert'             : (context) => AlertPage(),
      'avatar'            : (context) => AvatarPage(),
      'card'              : (context) => CardPage(),
      'animatedContainer' : (context) => AnimateContainerPage(),
      'inputs'            : (context) => InputPage(),
      'sliders'           : (context) => SliderPage(),
      'list'              : (context) => ListaPage()
    };
