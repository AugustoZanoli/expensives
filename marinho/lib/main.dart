import 'package:flutter/material.dart';
import 'package:marinho/components/transaction_form.dart';
import './components/transaction_form.dart';
import './components/transaction_list.dart';
import 'models/transaction.dart';
import 'dart:math';

//Função main para rodar o nosso app
main() {
  runApp(ExpensesApp());
}

//Criação da nossa classe principal, a qual da retorno para a homepage
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

//Criação da homepage
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    )
  ];

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
              onSubmit: _addTransaction); // Passa a função _addTransaction
        });
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  //criação do widget inicial, nossa tela
  Widget build(BuildContext context) {
    //retorna o Scaffold para criar e definir as coisas da nossa home
    return Scaffold(
      //cria a barra de começo de página, definindo o título da página, a "Cabeça"
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Despesas pessoais'),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: Icon(Icons.add)),
        ],
      ),
      //cria o "corpo" da nossa homepage
      body: SingleChildScrollView(
        child: Column(
          //cuida do alinhamento de tudo que irá vir no corpo por padrão
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          //usa o children como uma lista, para poder adicionar os widgets com diversos modificadores
          children: [
            //cria um container para receber os widgets desejados
            Container(
              //define a largura do nosso container
              width: double.infinity,
              //cria nosso card 1
              child: Card(
                color: Colors.purple.shade400,
                child: Text('Grafico'),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
