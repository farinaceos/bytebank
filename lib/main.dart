import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}


class FormularioTransferencia extends StatelessWidget{

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Criando TransferĂȘncia'),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0,8.0,16.0,8.0),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                style: TextStyle(
                  fontSize: 24.0
                ),
                decoration: InputDecoration(
                labelText: 'Numero da Conta',
                hintText: '0000'
              ),
                keyboardType: TextInputType.number,
              ),
            ), Padding(
              padding: const EdgeInsets.fromLTRB(16.0,8.0,16.0,8.0),
              child: TextField(
                controller: _controladorCampoValor,
                style: TextStyle(
                  fontSize: 24.0
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00'
              ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(onPressed: (){
              debugPrint('Clicou no Confirmar');
             final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
             final double? valor = double.tryParse(_controladorCampoValor.text);
             if(numeroConta != null && valor != null){
               final transferenciaCriada = Transferencia(valor,numeroConta);
                   debugPrint('$transferenciaCriada');
             }

            },
                child: Text('Confirmar')
            )


          ],
        )
    );
  }
}



class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TransferĂȘncias')
        ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.0,1000)),
          ItemTransferencia(Transferencia(200.0,2000)),
          ItemTransferencia(Transferencia(300.0,2034)),
        ],
      ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {  },
    child: Icon(Icons.add),
    ));

  }
  
}

class ItemTransferencia extends StatelessWidget {

final Transferencia _transferencia;


  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
