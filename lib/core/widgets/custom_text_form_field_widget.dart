

import 'package:flutter/material.dart';
import 'package:matrix/core/constants/app_sizes.dart';
import 'package:matrix/core/constants/colors.dart';


class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final String hintText;
  final bool showTitle;
  final TextCapitalization textCapitalization;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final bool passwordField;
  final String? Function(String?)? validator;
  final int? maxlines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final bool readOnly;
final double? borderRadius;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.name,
   this.inputType,
    this.hintText = "",
    this.showTitle = true,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.passwordField = false,
    this.validator,
    this.maxlines,
    this.maxLength,
    this.textInputAction,
    this.enabled,
    this.suffixIcon,
    this.focusNode,
    this.onEditingComplete,
    this.readOnly = false,
    this.borderRadius
  });

  @override
  State<CustomTextFieldWidget> createState() =>
      _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.passwordField;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? Text(
                widget.name,
                style: Theme.of(context).textTheme.labelMedium,
              )
            : const SizedBox(),

        SizedBox(height: AppSize.small(context)),

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
          ),
          child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            child: TextFormField(
              enabled: widget.enabled ?? true,
              controller: widget.controller,
              keyboardType: widget.inputType,
              obscureText: obscureText,
              cursorColor: lightGreyColor,
              textInputAction: widget.textInputAction,
              maxLength: widget.maxLength,
              maxLines: widget.maxlines ?? 1,
              readOnly: widget.readOnly,
              focusNode: widget.focusNode,
              onEditingComplete: widget.onEditingComplete,
              onChanged: widget.onChanged,
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.bodyMedium,
            
            
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: AppSize.mediumPadding(context),
                  horizontal: AppSize.mediumPadding(context),
                ),
                 border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
                filled: true,
                hintText:
                    widget.hintText.isNotEmpty ? widget.hintText : widget.name,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.blueGrey.withOpacity(0.4)),
            
                suffixIcon: widget.suffixIcon ??
                    (widget.passwordField
                        ? IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          )
                        : null),
              ),
            ),
          ),
        ),
      ],
    );
  }
}