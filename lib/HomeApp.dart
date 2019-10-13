import 'package:alcool_ou_gasolina/input-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  var _alcoolController = MoneyMaskedTextController(leftSymbol: 'R\$ ');
  var _gasolinaController = MoneyMaskedTextController(leftSymbol: 'R\$ ');
  var _mensagemResultado = '';

  void _limparCampos() {
      // Como tem um controller para os campos, pode-se limpá-los diretamente:
      _alcoolController.updateValue(0);
      _gasolinaController.updateValue(0);
      setState(() {
        _mensagemResultado = '';
      });
  }

  void _calcular() {

    if (_alcoolController.numberValue == 0 || _gasolinaController.numberValue == 0) {
      setState(() {
        _mensagemResultado = "Digite os dois valores para continuar";
      });
      return;
    }

    var resultado =
        _alcoolController.numberValue / _gasolinaController.numberValue;

    if (resultado >= 0.7) {
      setState(() {
        _mensagemResultado = "É melhor abastecer com gasolina";
      });
    } else {
      setState(() {
        _mensagemResultado = "É melhor abastecer com álcool";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina'),
        // centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/logo.png'),
              SizedBox(height: 24),
              Text(
                'Saiba qual a melhor opção para abastecimento do seu carro',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Input(
                label: 'Preço do Álcool',
                controller: _alcoolController,
              ),
              Input(
                label: 'Preço da Gasolina',
                controller: _gasolinaController,
              ),
              SizedBox(height: 24),
              FlatButton(
                padding: EdgeInsets.all(15),
                textColor: Theme.of(context).primaryColor,
                child: Text(
                  'Limpar',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: _limparCampos,
              ),
              RaisedButton(
                padding: EdgeInsets.all(15),
                textColor: Theme.of(context).primaryTextTheme.body1.color,
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20),
                ),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: _calcular,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _mensagemResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
