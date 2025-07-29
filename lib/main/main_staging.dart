import 'package:exps_app/app/app.dart';
import 'package:exps_app/main/bootstrap/bootstrap.dart';

void main() {
  bootstrap(
    (expensesRepository) => App(
      expensesRepository: expensesRepository,
    ),
  );
}
