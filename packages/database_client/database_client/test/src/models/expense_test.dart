import 'package:clock/clock.dart';
import 'package:database_client/src/models/expense.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$Expense', () {
    test('Should return true when comparing two equal expenses.', () {
      final now = clock.now();

      final expense1 = Expense(
        userId: 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
        amount: 100,
        date: now,
      );
      final expense2 = Expense(
        userId: 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
        amount: 100,
        date: now,
      );

      expect(expense1, equals(expense2));
    });

    test('Should return false when comparing two different expenses.', () {
      final now = clock.now();

      final expense1 = Expense(
        userId: 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
        amount: 100,
        date: now,
      );
      final expense2 = Expense(
        userId: 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
        amount: 200,
        date: now,
      );

      expect(expense1, isNot(equals(expense2)));
    });

    group('toJson', () {
      test('Should return a JSON map with the correct fields.', () {
        final now = clock.now();
        final expense = Expense(
          userId: 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
          amount: 100,
          date: now,
        );
        final json = expense.toJson();

        expect(
          json,
          equals({
            'user_id': 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
            'amount': 10000, // 100 * 100
            'date': now.toIso8601String(),
          }),
        );
      });
    });

    group('fromJson', () {
      test('Should return an Expense instance with the correct fields.', () {
        final now = clock.now();
        final json = {
          'user_id': 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
          'amount': 10000,
          'date': now.toIso8601String(),
        };
        final expense = Expense.fromJson(json);

        expect(
          expense,
          equals(
            Expense(
              userId: 'f8e1a603-a858-431d-bf5c-9e62be3fb266',
              amount: 100,
              date: now,
            ),
          ),
        );
      });
    });
  });
}
