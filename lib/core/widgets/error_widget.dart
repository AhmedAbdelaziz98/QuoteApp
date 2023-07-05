import 'package:flutter/material.dart';
import 'package:quote/core/utils/app_colors.dart';
import 'package:quote/core/utils/mediaquery_values.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key, this.onPress, this.message});
  final Function()? onPress;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber_rounded,
          color: AppColors.primary,
          size: 150,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            message ?? "Something Went Wrong",
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          'Please Try Again',
          style: TextStyle(
              color: AppColors.hint, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: context.height * 0.05,
        ),
        ElevatedButton(
            onPressed: onPress,
            style: ElevatedButton.styleFrom(

                // alignment: Alignment.center,
                // animationDuration: const Duration(seconds:1),
                // padding: const EdgeInsets.all(22),
                // visualDensity: VisualDensity.adaptivePlatformDensity,
                //   enableFeedback: true,
                fixedSize: Size(context.width * 0.55, 55),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primary,
                elevation: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text('Reload Screen',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                )))
      ],
    );
  }
}
