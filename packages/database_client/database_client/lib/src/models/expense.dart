import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense.g.dart';

/// {@template expense}
/// Represents an expense.
/// {@endtemplate}
@JsonSerializable()
class Expense extends Equatable {
  /// {@macro expense}
  const Expense({
    required this.amount,
    required this.date,
  });

  /// Returns a [Expense] instance with data populated from the given [json].
  @override
  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  /// The amount of the expense.
  @JsonKey(fromJson: _serializeAmountFromJson, toJson: _serializeAmountToJson)
  final double amount;

  /// The date of the expense.
  final DateTime date;

  @override
  List<Object> get props => [amount, date];

  /// Converts the current [Expense] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$ExpenseToJson(this);

  /// Converts the given amount from cents to dollars.
  ///
  /// This method takes an integer [value] and returns the result of dividing
  /// it by 100 as a double.
  static double _serializeAmountFromJson(int value) => value / 100;

  /// Converts the given amount from dollars to cents.
  ///
  /// This method takes a double [value] and returns the result of multiplying
  /// it by 100 as an integer.
  static int _serializeAmountToJson(double value) => (value * 100).toInt();
}
