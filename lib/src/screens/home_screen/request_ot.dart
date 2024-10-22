import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';
import 'package:work_o_clock/src/widgets/base_button.dart';

class RequestOvertimeScreen extends StatelessWidget {
  const RequestOvertimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Request Overtime',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: BaseColors.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Select date',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  // Implement date picker here
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  // Set the selected date in the text field
                  if (selectedDate != null) {
                    // Update the text field with the selected date
                  }
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Duration (Hours)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter duration',
                  prefixIcon: const Icon(Icons.access_time),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              const Text(
                'Reason for Overtime',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter your reason',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Submit Button
              BaseButton(
                text: 'Submit Request',
                onPressed: () {
                  Get.snackbar('Request Submitted',
                      'Your leave request has been submitted.',
                      snackPosition: SnackPosition.BOTTOM);
                },
                backgroundColor: BaseColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
