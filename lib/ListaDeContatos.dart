import 'package:flutter/material.dart';
import 'Formulario.dart';

const _tituloAppBar = "Lista de contatos";

class ListaDeContatos extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaDeContatosState();
  }
}

class ListaDeContatosState extends State<ListaDeContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final tranferencia = widget._transferencias[indice];
          return ItemTransferencia(tranferencia);
        },
      ),
// criando o obotao de ação
      floatingActionButton: FloatingActionButton(
        // escolhendo o icone do botao
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_box),
        title: Text(_transferencia.nome.toString()),
        subtitle: Text(_transferencia.numero.toString()),
      ),
    );
  }
}

class Transferencia {
  final int numero;
  final String nome;

  Transferencia(this.nome, this.numero);

  @override
  String toString() {
    return 'Transferencia { valor: $nome, numeroConta: $numero }';
  }
}

void _atualiza(Transferencia transferenciaRecebida) {}
