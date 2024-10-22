import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';
import 'package:work_o_clock/src/widgets/base_button.dart';

class RequestLeaveScreen extends StatelessWidget {
  const RequestLeaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leaveTypes = ['Sick Leave', 'Casual Leave', 'Annual Leave'];
    String? selectedLeaveType;
    DateTime? startDate;
    DateTime? endDate;
    final reasonController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Request Leave',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: BaseColors.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Leave Type Dropdown
              DropdownButtonFormField<String>(
                value: selectedLeaveType,
                hint: const Text('Select Leave Type'),
                onChanged: (String? newValue) {
                  selectedLeaveType = newValue;
                },
                items: leaveTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Leave Type',
                  prefixIcon: const Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Start Date Picker
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onTap: () async {
                  startDate = await _selectDate(context);
                },
              ),
              const SizedBox(height: 16),

              // End Date Picker
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'End Date',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onTap: () async {
                  endDate = await _selectDate(context);
                },
              ),
              const SizedBox(height: 16),

              // Reason TextField
              TextField(
                controller: reasonController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Reason for Leave',
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Submit Button
              BaseButton(
                text: 'Submit Request',
                onPressed: () {
                  // Handle the submission logic here
                  // You can add validations and send the request to your backend
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

  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    return pickedDate;
  }
}
