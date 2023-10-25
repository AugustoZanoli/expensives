import 'package:flutter/material.dart';
import 'package:marinho/models/transaction.dart';
import 'package:intl/intl.dart';

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
class MyHomePage extends StatelessWidget {
  String title;
  String value;

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

  @override
  //criação do widget inicial, nossa tela
  Widget build(BuildContext context) {
    //retorna o Scaffold para criar e definir as coisas da nossa home
    return Scaffold(
        //cria a barra de começo de página, definindo o título da página, a "Cabeça"
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Despesas pessoais'),
        ),
        //cria o "corpo" da nossa homepage
        body: Column(
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
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$' + tr.value.toStringAsFixed(2),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.purple.shade900,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.purple.shade100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            //cria nosso card 2, fora do container. Sendo assim, os modificadores do container não se aplicam aqui
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (newValue) => title = newValue,
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                      onChanged: (newValue) => value = newValue,
                      decoration: InputDecoration(
                        labelText: 'Valor (R\$)',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          child: Text(
                            'Nova Transação',
                          ),
                          foregroundColor: Colors.purple,
                          onPressed: () {
                            print(title);
                            print(value);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
