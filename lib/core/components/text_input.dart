import 'package:flutter/material.dart';
import '../utils/app_settings.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData prefixIconData;
  final bool isPassword;
  final bool fixedLeftDir;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final Function(bool state)? switchSuffixIcon;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final bool hideSuffixIcon;

  const TextInput(
      {super.key,
      required this.controller,
      required this.label,
      this.validator,
      required this.prefixIconData,
      this.inputType = TextInputType.text,
      this.textAlign = TextAlign.start,
      this.fixedLeftDir = false,
      this.focusNode,
      this.switchSuffixIcon,
      this.hideSuffixIcon = false,
      this.isPassword = false});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _visiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      validator: widget.validator,
      textAlign: widget.textAlign,
      obscureText: (widget.isPassword && !_visiblePassword),
      style: const TextStyle(fontSize: 18),
      cursorColor: Theme.of(context).primaryColor,
      textDirection: widget.fixedLeftDir ? TextDirection.ltr : null,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.red),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red, width: 1, style: BorderStyle.solid)),
          prefixIcon: Icon(
            widget.prefixIconData,
            color:
                MaterialColorGenerator.from(AppSettings.primaryColor).shade500,
          ),
          suffixIcon: !widget.hideSuffixIcon && widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _visiblePassword = !_visiblePassword;
                      if (widget.switchSuffixIcon != null) {
                        widget.switchSuffixIcon!(_visiblePassword);
                      }
                    });
                  },
                  icon: Icon(
                    !_visiblePassword ? Icons.visibility_off : Icons.visibility,
                    color: MaterialColorGenerator.from(AppSettings.primaryColor)
                        .shade500,
                  ))
              : null,
          label: Text(widget.label,
              style: Theme.of(context).textTheme.titleMedium),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppSettings.inputBorder)),
          fillColor: AppSettings.greyColor,
          filled: true),
    );
  }
}
