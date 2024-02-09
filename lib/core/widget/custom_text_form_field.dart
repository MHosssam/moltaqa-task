import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? suffixIcon;
  final void Function()? suffixOnTap;
  final bool? obscureText;
  final int? maxLine;
  final String? Function(String?)? validator;
  final AutovalidateMode? validateType;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? enabled;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget;
  final Color? fillColor;
  final bool? enableInteractiveSelection;
  final bool? suffixBool;

  const CustomTextFormField({
    Key? key,
    this.prefixIcon,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.suffixOnTap,
    this.obscureText,
    this.maxLine,
    this.validator,
    this.validateType,
    this.keyboardType,
    this.readOnly,
    this.enabled,
    this.onChanged,
    this.onFieldSubmitted,
    this.contentPadding,
    this.inputFormatters,
    this.onTap,
    this.suffixWidget,
    this.fillColor,
    this.enableInteractiveSelection,
    this.suffixBool = false,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool obscureText = false;
  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText ?? false;
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enabled == false ? 0.4 : 1.0,
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
        validator: widget.validator,
        readOnly: widget.readOnly ?? false,
        autovalidateMode: widget.validateType ?? AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        maxLines: widget.maxLine ?? 1,
        inputFormatters: widget.inputFormatters,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        textAlignVertical: (widget.maxLine == null) ? TextAlignVertical.center : TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: widget.contentPadding,
          fillColor: widget.fillColor,
          prefixIcon: widget.prefixIcon != null
              ? Align(
                  widthFactor: 1.0,
                  alignment: Alignment.topCenter,
                  heightFactor: (widget.maxLine ?? 1).toDouble(),
                  child: Container(
                    width: MySizes.buttonHeight,
                    height: MySizes.buttonHeight,
                    margin: const EdgeInsetsDirectional.only(start: MySizes.defaultPadding * .25),
                    child: Icon(
                      widget.prefixIcon!,
                      size: MySizes.largePadding * .75,
                      color: _focusNode.hasFocus
                          ? context.colorScheme.primary
                          : context.colorScheme.onPrimaryContainer,
                    ),
                  ),
                )
              : null,
          suffixIcon: widget.suffixBool == true
              ? IconButton(
                  onPressed: () => setState(() => obscureText = !obscureText),
                  icon: Icon(
                    !obscureText ? Icons.visibility : Icons.visibility_off,
                    color: context.colorScheme.primary,
                  ),
                )
              : widget.suffixWidget,
        ),
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.onBackground,
          height: widget.maxLine != null ? 1.2 : 2.3,
        ),
      ),
    );
  }
}
