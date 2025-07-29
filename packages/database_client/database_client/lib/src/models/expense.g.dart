// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
  userId: json['user_id'] as String,
  amount: Expense._serializeAmountFromJson((json['amount'] as num).toInt()),
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
  'user_id': instance.userId,
  'amount': Expense._serializeAmountToJson(instance.amount),
  'date': instance.date.toIso8601String(),
};
