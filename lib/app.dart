import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quote/features/random_quote/presentation/screens/quote_screen.dart';

import 'config/routers/app_routes.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quote App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const QuoteScreen(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
