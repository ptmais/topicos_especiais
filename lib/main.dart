import 'package:flutter/material.dart';
import 'package:investimento_app/page/home_page.dart';
import 'package:investimento_app/page/login_page.dart';
import 'package:investimento_app/utils/utils_consts.dart';

void main() => runApp(new MyApp());

final rotas = <String, WidgetBuilder> {
  Consts.LoginPageTag: (context) => LoginPage(),
  Consts.HomePageTag: (context) => HomePage()
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Investimento',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      routes: rotas,
    );
  }
}
