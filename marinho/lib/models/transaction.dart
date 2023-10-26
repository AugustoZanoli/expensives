import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;
// Adicione a categoria

  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}

class ExpenseCategory {
  final String id;
  final String name;

  ExpenseCategory({required this.id, required this.name});
}

class TransactionFilter {
  DateTime? startDate;
  DateTime? endDate;
  ExpenseCategory? category;
}
