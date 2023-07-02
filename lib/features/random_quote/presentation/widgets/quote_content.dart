import 'package:flutter/material.dart';
import 'package:quote/core/utils/app_colors.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(30)),
      child: const Text(
        "Measuring Programming progress by lines of code is like measuring aircraft building progress by weight",
        style: TextStyle(fontSize: 22 , color: Colors.white , fontWeight: FontWeight.bold , height: 1.3),
      ),
    );
  }
}
