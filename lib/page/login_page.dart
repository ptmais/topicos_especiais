import 'package:flutter/material.dart';
import 'package:investimento_app/utils/utils_consts.dart';
import 'dart:io';
import 'package:investimento_app/utils/utils_text.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    final emailController = TextEditingController();
    final senhaController = TextEditingController();

    mostrarSnackBar(String mensagem){
      final snackBar = new SnackBar(
        content: new Text(mensagem),
        duration: new Duration(seconds: 3),
        backgroundColor: Colors.blueGrey
      );

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    efetuarLogin(){
      String email = emailController.text;
      String senha = senhaController.text;

      if(!UtilsTexto.isTextoValido(email) || !UtilsTexto.isTextoValido(senha)){
        mostrarSnackBar("Informe todos os campos");
        return;
      }

      if(senha != "123"){
        mostrarSnackBar("Senha correta é 123");
        return;
      }

      Navigator.of(context).pushNamed(Consts.HomePageTag);
    }

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: "Informe seu e-mail",
          icon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0)
      ),
      controller: emailController
    );

    final senha = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Informe sua senha",
          contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
          icon: Icon(Icons.security)
      ),
      controller: senhaController
    );

    final botaoLogin = new RaisedButton(
      onPressed: efetuarLogin,
      elevation: 5.0,
      color: Colors.lightBlueAccent,
      child: Text("Login", style: TextStyle(color: Colors.white)),
    );

    final botaoFechar = new RaisedButton(
      onPressed: ()=> exit(0),
      elevation: 5.0,
      color: Colors.blueGrey,
      child: Text("Fechar", style: TextStyle(color: Colors.white)),
    );

    final body = Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors:[
            Colors.blue,
            Colors.lightBlueAccent
          ]
        )
      ),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            email,
            SizedBox(height: 8.0),
            senha,
            SizedBox(height: 40.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  botaoLogin,
                  SizedBox(width: 8.0,),
                  botaoFechar
                ]
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: body
    );
  }

}