import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String formProperty;
  final Map<String, String> formValues;
  final bool focus;

  final bool validationEmail;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.validationEmail = false,
    this.focus = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic _validation({required value}) {
      if (value == null) {
        return 'Este campo es requerido';
      } else {
        if (validationEmail &&
            (value.isEmpty || !value.contains('@') || !value.contains('.'))) {
          //email validation
          return 'Email invalido';
        }
      }
      return null;
    }

    return TextFormField(
      autofocus: focus,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.done,
      enableSuggestions: false,
      autocorrect: false,
      initialValue: '',
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        return _validation(value: value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
      ),
    );
  }
}
