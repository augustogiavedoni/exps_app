import 'package:database_client/database_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// {@template expenses_database}
/// A database for expenses using Supabase.
/// {@endtemplate}
class Expenses implements ExpensesDatabase {
  /// {@macro expenses_database}
  const Expenses({
    required SupabaseClient client,
  }) : _client = client;

  /// The Supabase client.
  final SupabaseClient _client;

  @override
  Future<void> add(Expense expense) async {
    try {
      await _client.from('expenses').insert(expense.toJson());
    } catch (exception) {
      throw AddException(exception);
    }
  }
}
