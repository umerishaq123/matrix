

import 'package:flutter/material.dart';
import 'package:matrix/core/constants/app_sizes.dart';
import 'package:matrix/core/constants/colors.dart';

class CustomButtonWidget extends StatefulWidget {
  final Function()? onTap;
  final String? title;
  final double? width;
  final double? height;
  final bool? deleteButton;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final bool? hideTitle;
  final bool? isLoading;
  final bool? isPill;
  final IconData? buttonIcon;
  final Color? color; 
   final Color? borderColor; // ✅ new optional color

  const CustomButtonWidget({
    super.key,
    this.hideTitle,
    this.onTap,
    this.height,
    this.title,
    this.width,
    this.deleteButton,
    this.prefixIcon,
    this.prefixIconColor,
    this.isLoading = false,
    this.isPill,
    this.buttonIcon,
    this.color,
    this.borderColor, // ✅ accept external color
  });

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {




    return GestureDetector(
      onTap: widget.isLoading! ? null : widget.onTap,
      child: Container(
        width: widget.width ?? AppSize.getScreenWidth(context),
        height: widget.height ?? AppSize.buttonHeight(context),
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(
            color: widget.borderColor??primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            widget.isPill == true
                ? (widget.height ?? AppSize.buttonHeight(context)) / 2
                : AppSize.borderRadiusSmall(context),
          ),
        ),
        child: widget.isLoading!
            ? Center(
          child: CircularProgressIndicator(
            color: widget.deleteButton == null
                ? whiteColor
                : blackColor,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           if (widget.prefixIcon != null) ...[
  widget.prefixIcon!,
  SizedBox(width: AppSize.extraSmall(context)),
],
            if (widget.buttonIcon != null)
              Icon(
                widget.buttonIcon,
                color: widget.deleteButton == null
                    ? blackColor
                    :whiteColor,
              )
            else
              Text(
                '${widget.title}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: widget.deleteButton == null
                      ? whiteColor
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
