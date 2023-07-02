import 'package:flutter/material.dart';
import 'package:quote/core/utils/app_colors.dart';

class Refresh extends StatelessWidget {
  const Refresh({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration:  BoxDecoration(
        shape: BoxShape.circle, color: AppColors.primary,
      ),
      child:  const Icon(Icons.refresh, size: 28, ),
    );
  }
}
