import 'package:flutter/material.dart';

class ConverterDolarRealPage extends StatefulWidget {

  var txResultado = Text("");

  @override
  State<StatefulWidget> createState() => _ConverterDolarRealState();

}

class _ConverterDolarRealState extends State<ConverterDolarRealPage> {
  final tcValorController = TextEditingController();
  final cotacaoDolar = 4.167;
  final int opcaoDolarParaReal = 1;
  final int opcaoRealParaDolar = 2;
  int rbSelecionado = 1;

  @override
  Widget build(BuildContext context) {
    aplicarConversao() {
      double valor = double.tryParse(tcValorController.text) ?? 0;
      double resultado;

      if (rbSelecionado == opcaoDolarParaReal) {
        resultado = valor * cotacaoDolar;
      } else {
        resultado = valor / cotacaoDolar;
      }

      setState(() {
        widget.txResultado = Text("Resultado: " + resultado.toString());
      });
    }

    final espacamentoVertical = SizedBox(height: 8.0);

    final espacamentoHorizontal = SizedBox(width: 10.0);

    final tfValor = TextFormField(
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: InputDecoration(
            hintText: "Informe o valor",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
        controller: tcValorController);

    aplicarEscolhaMoeda(int e) {
      setState(() {
        rbSelecionado = e;
      });
    }

    final rbDolarParaReal = new Column(
      children: <Widget>[
        Text("Dolar para Real"),
        new Radio(
            onChanged: (int e) => aplicarEscolhaMoeda(e),
            value: opcaoDolarParaReal,
            activeColor: Colors.lightBlue,
            groupValue: rbSelecionado)
      ],
    );

    final rbRealParaDolar = new Column(
      children: <Widget>[
        Text("Real para Dolar"),
        new Radio(
            onChanged: (int e) => aplicarEscolhaMoeda(e),
            value: opcaoRealParaDolar,
            activeColor: Colors.lightBlue,
            groupValue: rbSelecionado)
      ],
    );

    final rbEscolhaMoeda = ButtonBar(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            rbDolarParaReal,
            espacamentoHorizontal,
            rbRealParaDolar
          ],
        ),
      ],
    );

    final btConveter = new RaisedButton(
      onPressed: aplicarConversao,
      elevation: 5.0,
      color: Colors.lightBlue,
      child: Text("Converter", style: TextStyle(color: Colors.white)),
    );

    return new Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          children: <Widget>[
            tfValor,
            espacamentoVertical,
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[rbEscolhaMoeda],
            ),
            espacamentoVertical,
            btConveter,
            espacamentoVertical,
            widget.txResultado
          ],
        )));
  }
}
