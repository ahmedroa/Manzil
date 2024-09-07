import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manzil/core/theme/colors.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Color? fillColor;
  final int? maxLength;
  final Function(String)? onChanged;
  final void Function()? onTap;
  final String? helperText;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? counter;
  final TextAlign? textAlign;
  final int? maxLines;
  const AppTextFormField({
    super.key,
    this.keyboardType,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.fillColor,
    this.maxLength,
    this.onChanged,
    this.helperText,
    this.prefixText,
    this.borderRadius,
    this.prefixIcon,
    this.inputFormatters,
    this.onTap,
    this.counter,
    this.maxLines,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType,
      // style: TextStyles.font14GrayRegular.copyWith(color: Theme.of(context).colorScheme.secondary),
      onChanged: onChanged,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      maxLines: maxLines ?? 1,
      onTap: onTap,
      obscureText: isObscureText ?? false,
      validator: (value) {
        if (value == null) {
          return 'لا يمكن ترك الحقل فارغ';
        }
        return null;
      },
      decoration: InputDecoration(
        helperText: helperText,
        suffixText: prefixText,
        counter: counter,
        isDense: true,
        focusedBorder: focusedBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.kPrimaryColor,
                width: 1.3,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(6.0),
            ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        // hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        helperStyle: const TextStyle(color: Color(0xffA2A2A2)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? Colors.white,
        filled: true,
      ),
    );
  }
}
