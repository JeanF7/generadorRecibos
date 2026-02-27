import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/local/database_service.dart';
import 'data/repositories/config_repository.dart';
import 'data/repositories/people_repository.dart';
import 'data/repositories/receipt_repository.dart';
import 'data/services/excel_service.dart';
import 'logic/config_cubit/config_cubit.dart';
import 'logic/people_list_cubit/people_list_cubit.dart';
import 'logic/receipt_form_cubit/receipt_form_cubit.dart';
import 'logic/history_cubit/history_cubit.dart';
import 'logic/auth_cubit/auth_cubit.dart'; // Added
import 'presentation/home_screen.dart';
import 'presentation/login_screen.dart'; // Added

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es');
  
  // Initialize Database
  final dbService = DatabaseService();
  await dbService.openDB();

  // Repositories
  final configRepo = ConfigRepository(dbService);
  final peopleRepo = PeopleRepository(dbService);
  final receiptRepo = ReceiptRepository(dbService);
  
  // Services
  final excelService = ExcelService();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: configRepo),
        RepositoryProvider.value(value: peopleRepo),
        RepositoryProvider.value(value: receiptRepo),
        RepositoryProvider.value(value: excelService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ConfigCubit(configRepo)..loadConfig()),
          BlocProvider(create: (_) => PeopleListCubit(peopleRepo, excelService)..loadPeople()),
          BlocProvider(create: (_) => ReceiptFormCubit(receiptRepo)),
          BlocProvider(create: (_) => HistoryCubit(receiptRepo)),
          BlocProvider(create: (_) => AuthCubit(configRepo)..checkAuthStatus()), // Added
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generador de Recibos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

