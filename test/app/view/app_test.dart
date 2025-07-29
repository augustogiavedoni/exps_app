import 'package:expenses_repository/expenses_repository.dart';
import 'package:exps_app/app/app.dart';
import 'package:exps_app/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockExpensesRepository extends Mock implements ExpensesRepository {}

void main() {
  group('$App', () {
    late ExpensesRepository expensesRepository;

    setUp(() {
      expensesRepository = _MockExpensesRepository();
    });

    testWidgets(
      'Should render the $CounterPage widget.',
      (tester) async {
        await tester.pumpWidget(
          App(expensesRepository: expensesRepository),
        );

        expect(find.byType(CounterPage), findsOneWidget);
      },
    );
  });
}
