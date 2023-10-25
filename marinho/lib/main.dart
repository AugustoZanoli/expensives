import 'package:flutter/material.dart';
import 'package:marinho/components/transiction_list.dart';
import 'package:marinho/models/transaction.dart';

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
  final titleController = TextEditingController();
  final valueController = TextEditingController();

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
            TransactionList(_transactions),
            //cria nosso card 2, fora do container. Sendo assim, os modificadores do container não se aplicam aqui
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                      controller: valueController,
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
                            print(titleController.text);
                            print(valueController.text);
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
