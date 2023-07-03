import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/core/utils/app_colors.dart';
import 'package:quote/features/random_quote/presentation/cubit/random_quote_cubit.dart';

class Refresh extends StatelessWidget {
  const Refresh({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<RandomQuoteCubit>()
          .getRandomQuotes(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
        child: const Icon(
          Icons.refresh,
          size: 28,
        ),
      ),
    );
  }
}
