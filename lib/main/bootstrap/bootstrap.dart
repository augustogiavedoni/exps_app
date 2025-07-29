import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expenses_repository/expenses_repository.dart';
import 'package:exps_app/main/bootstrap/app_bloc_observer.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_database/supabase_database.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function(
    ExpensesRepository expensesRepository,
  )
  builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await SupabaseDatabase.initialize();

  final expensesRepository = ExpensesRepository(
    database: SupabaseDatabase.instance.expenses,
  );

  runApp(
    await builder(
      expensesRepository,
    ),
  );
}
