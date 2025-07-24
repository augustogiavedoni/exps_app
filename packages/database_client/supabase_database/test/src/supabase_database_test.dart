// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:database_client/database_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_database/supabase_database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  group('$SupabaseDatabase', () {
    group('instance', () {
      test(
        'Should throw a $StateError when accessing instance before '
        'initialization.',
        () => expect(
          () => SupabaseDatabase.instance,
          throwsA(isA<StateError>()),
        ),
      );

      test('Should be initialized and accessed via singleton.', () async {
        final client = SupabaseClient(
          'http://localhost:54321',
          'test',
          httpClient: MockSupabaseHttpClient(),
        );

        SupabaseDatabase.setInstanceForTesting(client);

        final database = SupabaseDatabase.instance;

        expect(database, isNotNull);
        expect(database, isA<SupabaseDatabase>());

        SupabaseDatabase.resetInstance();
      });
    });

    group('setInstanceForTesting', () {
      tearDown(SupabaseDatabase.resetInstance);

      test('Should return a new instance of $SupabaseDatabase.', () {
        final client = SupabaseClient(
          'http://localhost:54321',
          'test',
          httpClient: MockSupabaseHttpClient(),
        );

        SupabaseDatabase.setInstanceForTesting(client);

        final database = SupabaseDatabase.instance;

        expect(database, isNotNull);
        expect(database, isA<SupabaseDatabase>());
      });
    });

    group('resetInstance', () {
      late SupabaseClient client;

      setUp(() {
        client = SupabaseClient(
          'http://localhost:54321',
          'test',
          httpClient: MockSupabaseHttpClient(),
        );

        SupabaseDatabase.setInstanceForTesting(client);
      });

      test(
        'Should throw a $StateError when accessing instance after '
        'resetting.',
        () {
          SupabaseDatabase.resetInstance();

          expect(
            () => SupabaseDatabase.instance,
            throwsA(isA<StateError>()),
          );
        },
      );
    });

    group('Expenses', () {
      late SupabaseClient client;

      setUp(() {
        client = SupabaseClient(
          'http://localhost:54321',
          'test',
          httpClient: MockSupabaseHttpClient(),
        );

        SupabaseDatabase.setInstanceForTesting(client);
      });

      tearDown(SupabaseDatabase.resetInstance);

      test('Should return an instance of $ExpensesDatabase.', () async {
        final database = SupabaseDatabase.instance;

        expect(database.expenses, isNotNull);
        expect(database.expenses, isA<ExpensesDatabase>());
      });
    });
  });
}
