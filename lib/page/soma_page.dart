import 'package:flutter/material.dart';

class SomaPage extends StatefulWidget {

  var txResultado = Text("");
  var txEmailUsuarioLogado;
  String emailUsuarioLogado;

  SomaPage({this.emailUsuarioLogado}){

    txEmailUsuarioLogado = Text("Usuário logado: " + "");
  }

  @override
  State<StatefulWidget> createState() => _SomaPageState();

}

class _SomaPageState extends State<SomaPage> {

  final tcPrimeiroValorController = TextEditingController();
  final tcSegundoValorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    aplicarSomar() {
      double primeiroValor = double.tryParse(tcPrimeiroValorController.text) ??
          0;
      double segundoValor = double.tryParse(tcSegundoValorController.text) ?? 0;
      double soma = primeiroValor + segundoValor;

      setState(() {
        widget.txResultado = Text(soma.toString());
      });
    }

    final tfPrimeiroValor = TextFormField(
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: InputDecoration(
            hintText: "Primeiro valor",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
        ),
        controller: tcPrimeiroValorController
    );

    final tfSegundoValor = TextFormField(
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: InputDecoration(
            hintText: "Segundo valor",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
        ),
        controller: tcSegundoValorController
    );

    final btSomar = new RaisedButton(
      onPressed: aplicarSomar,
      elevation: 5.0,
      color: Colors.lightBlue,
      child: Text("Somar", style: TextStyle(color: Colors.white)),
    );

    final espacamentoVertical = SizedBox(height: 8.0);

    return new Container (
        padding: EdgeInsets.all(16.0),
        child: Center(
            child: Column(
              children: <Widget>[
                widget.txEmailUsuarioLogado,
                tfPrimeiroValor,
                espacamentoVertical,
                tfSegundoValor,
                espacamentoVertical,
                btSomar,
                espacamentoVertical,
                widget.txResultado
              ],
            )
        )
    );
  }
}