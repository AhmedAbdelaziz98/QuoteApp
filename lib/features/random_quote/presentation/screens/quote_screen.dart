import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart' as di;
import '../cubit/random_quote_cubit.dart';
import '../widgets/quote_content.dart';
import '../widgets/refresh_quote.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<RandomQuoteCubit>()..getRandomQuotes(),
      child: Scaffold(
        appBar: AppBar(),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Text('Quote App')),
              QuoteContent(),
              Refresh(),
            ],
          ),
        ),
      ),
    );
  }
}
