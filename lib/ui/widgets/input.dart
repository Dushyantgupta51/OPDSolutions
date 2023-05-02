import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? trailing;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final Widget? label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool readOnly;
  final void Function()? onTap;
  final bool autofocus;

  const Input(
      {this.hintText,
      this.prefixIcon,
      this.trailing,
      this.suffixIcon,
      this.obscureText = false,
      this.onChanged,
      this.textInputAction,
      this.initialValue,
      this.label,
      this.keyboardType,
      this.controller,
      this.maxLines,
      this.textAlign,
      this.maxLength,
      this.textStyle,
      this.margin,
      this.textCapitalization,
      this.focusNode,
      this.onFieldSubmitted,
      this.readOnly = false,
      this.onTap,
      this.autofocus = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: label == null ? 65 : 105,
      decoration: const BoxDecoration(
          color: Color(0xfff8f9ff),
          border: Border(
              right: BorderSide(color: Colors.white, width: 2.0),
              bottom: BorderSide(color: Colors.white, width: 2.0),
              left: BorderSide(color: Colors.black12, width: 2),
              top: BorderSide(color: Colors.black12, width: 2))),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(label == null ? 0 : 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    label ?? Container(),
                    TextFormField(
                        onTap: onTap,
                        controller: controller,
                        readOnly: readOnly,
                        obscureText: obscureText,
                        textAlign: textAlign ?? TextAlign.left,
                        decoration: InputDecoration(
                            hintText: hintText,
                            counterText: '',
                            prefixIcon: prefixIcon,
                            suffixIcon: suffixIcon,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none)),
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 23, 101, 174),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        onChanged: onChanged,
                        autocorrect: false,
                        autofocus: autofocus,
                        textInputAction: textInputAction,
                        initialValue: initialValue,
                        keyboardType: keyboardType,
                        maxLines: maxLines,
                        maxLength: maxLength,
                        focusNode: focusNode,
                        cursorHeight: 30,
                        onFieldSubmitted: onFieldSubmitted,
                        textCapitalization:
                            textCapitalization ?? TextCapitalization.none)
                  ]),
            ),
          ),
          trailing ?? Container(),
        ],
      ),
    );
  }
}
