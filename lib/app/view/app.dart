import 'package:expenses_repository/expenses_repository.dart';
import 'package:exps_app/counter/counter.dart';
import 'package:exps_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required ExpensesRepository expensesRepository,
  }) : _expensesRepository = expensesRepository;

  final ExpensesRepository _expensesRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _expensesRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}
