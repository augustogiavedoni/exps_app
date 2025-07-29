// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:database_client/database_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_database/src/databases/expenses_database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  group('$Expenses', () {
    late SupabaseClient client;
    late Expenses database;

    setUp(() {
      client = SupabaseClient(
        'http://localhost:54321',
        'test',
        httpClient: MockSupabaseHttpClient(),
      );

      database = Expenses(client: client);
    });

    group('add', () {
      test('Should add an expense to the database.', () async {
        final expense = Expense(
          userId: 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
          amount: 100,
          date: DateTime.now(),
        );

        await database.add(expense);

        final expenses = await client.from('expenses').select();

        expect(expenses, equals([expense.toJson()]));
      });

      group('Exception', () {
        late SupabaseClient client;
        late Expenses database;

        setUp(() {
          client = SupabaseClient(
            'http://localhost:54321',
            'test',
            httpClient: MockSupabaseHttpClient(
              postgrestExceptionTrigger: (schema, table, data, type) {
                if (table == 'expenses' && type == RequestType.insert) {
                  throw PostgrestException(
                    message: 'mocked error',
                    code: '23505',
                  );
                }
              },
            ),
          );

          database = Expenses(client: client);
        });

        test('Should throw an $AddException when an error occurs.', () {
          expect(
            () => database.add(
              Expense(
                userId: 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
                amount: 100,
                date: DateTime.now(),
              ),
            ),
            throwsA(isA<AddException>()),
          );
        });
      });
    });
  });
}
