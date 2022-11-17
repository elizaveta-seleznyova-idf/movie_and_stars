import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField({
    required this.titleText,
    required this.textFieldWidth,
    required this.controller,
    required this.formatter,
    required this.lengthLimit,
    required this.isObscureText,
    required this.hintText,
    required this.onChanged,
    required this.validator,
    super.key,
  });

  final String titleText;
  final double textFieldWidth;
  final TextEditingController controller;
  final TextInputFormatter formatter;
  final int lengthLimit;
  final bool isObscureText;
  final String hintText;
  final onChanged;
  final validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: AppTextStyles.sfProRegularSelected14px,
        ),
        const SizedBox(height: Dimens.size10),
        SizedBox(
          width: textFieldWidth,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            autocorrect: false,
            enableSuggestions: false,
            cursorColor: Colors.white,
            style: const TextStyle(
              color: AppColorsDark.unselectedColor,
            ),
            inputFormatters: [
              FilteringTextInputFormatter
                  .digitsOnly,
              formatter,
              LengthLimitingTextInputFormatter(lengthLimit),
            ],
            obscureText: isObscureText,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: AppColorsDark.secondaryColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: Dimens.size10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.size4),
                borderSide: const BorderSide(
                  width: Dimens.size0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
