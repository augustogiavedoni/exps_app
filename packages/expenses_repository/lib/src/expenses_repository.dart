import 'package:database_client/database_client.dart';

/// {@template expenses_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ExpensesRepository {
  /// {@macro expenses_repository}
  const ExpensesRepository({
    required ExpensesDatabase database,
  }) : _database = database;

  final ExpensesDatabase _database;

  /// Adds a new expense to the database.
  ///
  /// ### Parameters
  ///
  /// - [expense]: The expense to add.
  ///
  /// ### Throws
  ///
  /// - [AddException] if the expense cannot be added.
  Future<void> addExpense(Expense expense) => _database.add(expense);
}
