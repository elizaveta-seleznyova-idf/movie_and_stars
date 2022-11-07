import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/config/theme/app_colors.dart';

class LoginTextField extends StatefulWidget {
  LoginTextField({
    required this.controller,
    required this.onChanged,
    required this.validator,
    required this.prefixIcon,
    this.isSuffixIcon = false,
    super.key,
  });

  final TextEditingController controller;
  void Function(String) onChanged;
  String? Function(String?)? validator;
  final Widget prefixIcon;
  final bool isSuffixIcon;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return SizedBox(
      width: Responsive.isDesktop(context) ? Dimens.size400 : width,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isSuffixIcon ? !_passwordVisible : _passwordVisible,
        autocorrect: false,
        enableSuggestions: false,
        cursorColor: Colors.white,
        style: const TextStyle(
          color: AppColorsDark.unselectedColor,
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isSuffixIcon
              ? IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              : null,
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
    );
  }
}
