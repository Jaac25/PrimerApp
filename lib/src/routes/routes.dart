import 'package:flutter/material.dart';

import 'package:segundacomponents/src/pages/alert_page.dart';
import 'package:segundacomponents/src/pages/animated_container.dart';
import 'package:segundacomponents/src/pages/avatar_page.dart';
import 'package:segundacomponents/src/pages/card_page.dart';
import 'package:segundacomponents/src/pages/homePage.dart';
import 'package:segundacomponents/src/pages/input_page.dart';
import 'package:segundacomponents/src/pages/listview_page.dart';
import 'package:segundacomponents/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getAppLocationRoutes(){
  return <String,WidgetBuilder>{
    '/' : (BuildContext context) => HomePage(),
    'alert' : (BuildContext context) => AlertPage(),
    'avatar' : (BuildContext context) => AvatarPage(),
    'card' : (BuildContext context) => CardPage(),
    'animated':(BuildContext context) => AnimatedPageContainer(),
    'inputs' : (BuildContext context) => InputPage(),
    'slider' : (BuildContext context) => SliderPage(),
    'list' : (BuildContext context) => ListPage(),
  };
}