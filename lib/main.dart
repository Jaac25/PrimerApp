import 'package:flutter/material.dart';

import 'package:segundacomponents/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //home_tem body = new hom
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en','US'),
        const Locale('es','ES')
      ],
      debugShowCheckedModeBanner: false,
      title: 'FirstApp',
      initialRoute: '/',
      routes: getAppLocationRoutes(),
      color: Colors.yellow,
    );
  }
}
