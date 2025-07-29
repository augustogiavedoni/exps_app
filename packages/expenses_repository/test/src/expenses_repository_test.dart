// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:database_client/database_client.dart';
import 'package:expenses_repository/expenses_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockExpensesDatabase extends Mock implements ExpensesDatabase {}

void main() {
  group('$ExpensesRepository', () {
    late ExpensesDatabase database;
    late ExpensesRepository repository;

    setUp(() {
      database = _MockExpensesDatabase();
      repository = ExpensesRepository(database: database);
    });

    test('can be instantiated', () {
      expect(ExpensesRepository(database: database), isNotNull);
    });

    group('addExpense', () {
      late Expense expense;

      setUp(() {
        expense = Expense(
          userId: 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
          amount: 100,
          date: DateTime.now(),
        );
      });

      test('Should add an expense to the database.', () async {
        when(() => database.add(expense)).thenAnswer((_) async {});

        await repository.addExpense(expense);

        verify(() => database.add(expense)).called(1);
      });

      test('Should throw an $AddException when an error occurs.', () {
        when(() => database.add(expense)).thenThrow(
          AddException('mocked-exception'),
        );

        expect(
          () => repository.addExpense(expense),
          throwsA(isA<AddException>()),
        );
      });
    });
  });
}
