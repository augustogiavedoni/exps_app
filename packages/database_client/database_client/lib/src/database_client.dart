import 'package:database_client/src/databases/databases.dart';

/// {@template database_client}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
abstract class DatabaseClient {
  /// The database for expenses.
  ExpensesDatabase get expenses;
}
