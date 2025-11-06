import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:structure_mvvm/utils/date/date_utils.dart';


Future<void> pickTime(
  BuildContext context,
  TextEditingController controller,
) async {
  final initialTime = TimeOfDay.now();

  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: initialTime,
  );

  if (pickedTime != null) {
    if (context.mounted) {
      final formattedTime = pickedTime.format(context);
      controller.text = formattedTime;
    }
  }
}

Future<void> datePicker(
  BuildContext context,
  TextEditingController controller,
) async {
  final initialDate = DateTime.now();

  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1980),
    lastDate: DateTime(3000),
  );

  if (pickedDate != null) {
    if (context.mounted) {
      controller.text = DateUtilsHelper.formatDDMMYYYYSlash(pickedDate);
    }
  }
}

int takeRandomNumberBetween0_2() {
  final int rand = math.Random().nextInt(3);
  return rand;
}
