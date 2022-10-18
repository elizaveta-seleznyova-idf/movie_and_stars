import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/login/login_bloc.dart';
import 'package:presentation/utils/image_path.dart';

class LoginPasswordTextFormField extends StatefulWidget {
  const LoginPasswordTextFormField({
    required this.bloc,
    required this.validator,
    super.key,
  });

  final LoginBloc bloc;
  final Function validator;

  @override
  State<LoginPasswordTextFormField> createState() =>
      _LoginPasswordTextFormFieldState();
}

class _LoginPasswordTextFormFieldState
    extends State<LoginPasswordTextFormField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.bloc.textPasswordController,
      obscureText: !_passwordVisible,
      autocorrect: false,
      enableSuggestions: false,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: AppColorsDark.unselectedColor,
      ),
      validator: (_) {
        widget.validator;
      },
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(
          ImagesPath.lockImage,
          width: Dimens.size18,
          height: Dimens.size18,
          fit: BoxFit.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
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
    );
  }
}
