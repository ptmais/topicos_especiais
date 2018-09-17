import 'package:flutter/material.dart';
import 'package:investimento_app/page/converter_dolar_real_page.dart';
import 'package:investimento_app/page/soma_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Investimento"),
              bottom: TabBar(
                tabs: <Widget>[Tab(text: "SOMA"), Tab(text: "DOLAR x REAL")],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                new SomaPage(),
                ConverterDolarRealPage()
              ],
            ),
          )),
    );
  }
}
