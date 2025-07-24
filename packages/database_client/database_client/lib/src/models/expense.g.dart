// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
  amount: Expense._serializeAmountFromJson((json['amount'] as num).toInt()),
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
  'amount': Expense._serializeAmountToJson(instance.amount),
  'date': instance.date.toIso8601String(),
};
