import 'package:flutter/material.dart';

import '../widgets/quote_content.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),
      body: const Column(
        children: [
          Center(child: Text('Quote App')),
          QuoteContent(),
          // Refresh(),
        ],
      ),
    );
  }
}
