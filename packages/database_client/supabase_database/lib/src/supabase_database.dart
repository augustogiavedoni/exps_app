import 'package:database_client/database_client.dart';
import 'package:supabase_database/src/databases/databases.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// {@template supabase_database}
/// Concrete implementation of [DatabaseClient] using Supabase.
/// {@endtemplate}
class SupabaseDatabase implements DatabaseClient {
  /// {@macro supabase_database}
  SupabaseDatabase._({
    required SupabaseClient client,
  }) : _expenses = Expenses(client: client);

  /// The singleton instance of [SupabaseDatabase].
  static SupabaseDatabase? _instance;

  /// The expenses database.
  final ExpensesDatabase _expenses;

  /// Returns the singleton instance of [SupabaseDatabase].
  ///
  /// Throws a [StateError] if [initialize] has not been called first.
  static SupabaseDatabase get instance {
    if (_instance == null) {
      throw StateError(
        'SupabaseDatabase has not been initialized. '
        'Call SupabaseDatabase.initialize() first.',
      );
    }

    return _instance!;
  }

  /// Initializes Supabase and creates the singleton instance.
  ///
  /// This method must be called before accessing [instance].
  static Future<void> initialize() async {
    if (_instance != null) {
      return; // Already initialized
    }

    await Supabase.initialize(
      url: const String.fromEnvironment('SUPABASE_PROJECT_URL'),
      anonKey: const String.fromEnvironment('SUPABASE_PROJECT_ANON_KEY'),
    );

    _instance = SupabaseDatabase._(
      client: Supabase.instance.client,
    );
  }

  /// Creates an instance with a custom client for testing purposes.
  ///
  /// This constructor is primarily intended for testing scenarios where you
  /// want to inject a mock or custom [SupabaseClient].
  static void setInstanceForTesting(SupabaseClient client) {
    _instance = SupabaseDatabase._(client: client);
  }

  /// Resets the singleton instance. This is useful for testing.
  static void resetInstance() {
    _instance = null;
  }

  @override
  ExpensesDatabase get expenses => _expenses;
}
