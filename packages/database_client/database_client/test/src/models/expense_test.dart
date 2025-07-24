import 'package:clock/clock.dart';
import 'package:database_client/src/models/expense.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$Expense', () {
    test('Should return true when comparing two equal expenses.', () {
      final now = clock.now();

      final expense1 = Expense(amount: 100, date: now);
      final expense2 = Expense(amount: 100, date: now);

      expect(expense1, equals(expense2));
    });

    test('Should return false when comparing two different expenses.', () {
      final now = clock.now();

      final expense1 = Expense(amount: 100, date: now);
      final expense2 = Expense(amount: 200, date: now);

      expect(expense1, isNot(equals(expense2)));
    });

    group('toJson', () {
      test('Should return a JSON map with the correct fields.', () {
        final now = clock.now();
        final expense = Expense(amount: 100, date: now);
        final json = expense.toJson();

        expect(
          json,
          equals({
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
          'amount': 10000,
          'date': now.toIso8601String(),
        };
        final expense = Expense.fromJson(json);

        expect(expense, equals(Expense(amount: 100, date: now)));
      });
    });
  });
}
