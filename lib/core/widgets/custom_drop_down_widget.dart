import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix/core/constants/colors.dart';

class CustomDropdownWidgetWithModel<T> extends StatefulWidget {
  final String name;
  final List<T>? menuItems;
  final T? initialSelection;
  final T? defaultOption;
  final Function(T?)? onSelected;
  final bool? enabled;
  final double? width;
  final bool? hideTitle;
  final String? errorText;
  final String? hintText;

  /// Required: defines how to extract label from T
  final String Function(T) labelBuilder;

  const CustomDropdownWidgetWithModel({
    super.key,
    required this.name,
    required this.labelBuilder,
    this.menuItems,
    this.initialSelection,
    this.defaultOption,
    this.onSelected,
    this.enabled,
    this.width,
    this.hideTitle,
    this.errorText,
    this.hintText,
  });

  @override
  State<CustomDropdownWidgetWithModel<T>> createState() =>
      _CustomDropdownWidgetWithModelState<T>();
}

class _CustomDropdownWidgetWithModelState<T>
    extends State<CustomDropdownWidgetWithModel<T>> {
  late List<T> _items;
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _items = _buildItemsList();
    _selectedValue = widget.initialSelection ?? widget.defaultOption;
  }

  List<T> _buildItemsList() {
    final items = [...?widget.menuItems];
    if (widget.defaultOption != null &&
        !items.any((item) =>
            widget.labelBuilder(item) ==
            widget.labelBuilder(widget.defaultOption as T))) {
      items.insert(0, widget.defaultOption as T);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isError =
        widget.errorText != null && widget.errorText!.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.hideTitle != true) ...[
          Text(
            widget.name,
            style: theme.textTheme.labelMedium,
          ),
          const SizedBox(height: 4),
        ],
        SizedBox(
          width: widget.width ?? double.infinity,
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              // fillColor: secondaryColor,
              hintText: widget.hintText ?? widget.name,
              hintStyle: theme.textTheme.bodyMedium!
                  .copyWith(color: Colors.blueGrey.withOpacity(0.4)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                isExpanded: true,
                value: _selectedValue,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                onChanged: widget.enabled == false
                    ? null
                    : (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                        widget.onSelected?.call(value);
                      },
                items: _items.map((item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: Text(
                      widget.labelBuilder(item),
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        if (isError) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              widget.errorText!,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.error),
            ),
          ),
        ],
      ],
    );
  }
}