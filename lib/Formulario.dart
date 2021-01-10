
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'ListaDeContatos.dart';


const _tituloAppbar = 'Criando transferencia';
const _rotuloNome = 'Nome da pessoa';
const _dicaNome = 'Nome do Contato';
const _dicaNumero = '000-000';
const _rotuloNumero = 'Número do contato';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return FormularioTransferenciaState();
  }

}
class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorNumero = TextEditingController();
  final TextEditingController _controladorNome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppbar),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorNome,
              dica: _dicaNome,
              rotulo: _rotuloNome,
            ),
            Editor(
              controlador: _controladorNumero,
              dica: _dicaNumero,
              rotulo: _rotuloNumero,
            ),
            RaisedButton(
              child:  Text("Confirmar"),
                onPressed:()=>_criarTranferencia(context)),
          ],
        ),
      ),
    );
  }

  void _criarTranferencia(BuildContext context){
    final int numeroContato = int.tryParse(_controladorNumero.text);
    final String nomeContato = _controladorNome.text;
    if (numeroContato != null && nomeContato != null){
      // se os valores forem direfentes de NULL ta recebendo como parametro o retorno da transferencia que ta em outra pasta uma caixa de textos e duas variaveis como retorno
      final transferenciaCriada = Transferencia(nomeContato,numeroContato);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}



class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String nome;
  final double numero;
  final String dica;
  final String rotulo;
  final IconData icone;

  const Editor(
      {this.controlador, this.nome, this.numero, this.dica, this.rotulo, this.icone});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: nome,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

