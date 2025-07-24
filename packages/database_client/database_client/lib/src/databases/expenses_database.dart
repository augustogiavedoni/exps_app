import 'package:database_client/src/exceptions/exceptions.dart';
import 'package:database_client/src/models/models.dart';

/// {@template expenses_database}
/// A database for expenses.
/// {@endtemplate}
abstract class ExpensesDatabase {
  /// Adds a new expense to the database.
  ///
  /// ### Parameters
  /// - [expense]: The [Expense] object to be added.
  ///
  /// ### Throws:
  /// - [AddException] if the operation fails.
  Future<void> add(Expense expense);
}
