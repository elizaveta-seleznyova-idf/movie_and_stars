import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/dimens/dimens.dart';

class LoginRegistrationButton extends StatelessWidget {
  const LoginRegistrationButton({
    required this.onPressed,
    required this.buttonImage,
    required this.buttonColor,
    super.key,
  });

  final onPressed;
  final String buttonImage;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.size54,
      height: Dimens.size54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            buttonColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Dimens.size44,
              ),
            ),
          ),
        ),
        child: SvgPicture.asset(
          buttonImage,
          width: Dimens.size50,
          height: Dimens.size50,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
