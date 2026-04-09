import 'package:flutter/material.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/enum_type.dart';


showCustomSnackBar({context, message, status}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Directionality(
        textDirection: TextDirection.ltr,
        child: Text(
          '$message',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:whiteColor),
        ),
      ),
      backgroundColor: status == StateType.failure ? redColor : primaryColor,
    ),
  );
}
