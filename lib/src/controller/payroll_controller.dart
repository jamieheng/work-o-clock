// payroll_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PayrollController extends GetxController {
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      startDate.value = picked; // Update the observable
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate.value ?? DateTime.now(),
      firstDate: startDate.value ??
          DateTime(2000), // End date should not be before start date
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      endDate.value = picked; // Update the observable
    }
  }
}
