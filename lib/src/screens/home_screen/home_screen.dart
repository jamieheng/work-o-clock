import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:work_o_clock/src/controller/home_controller.dart';
import 'package:work_o_clock/src/screens/home_screen/request_leave.dart';
import 'package:work_o_clock/src/screens/home_screen/request_ot.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';
import 'package:work_o_clock/src/widgets/base_table_calender.dart';
import 'package:work_o_clock/src/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: const HomeAppBar(
        name: 'Naksu In',
        position: 'Mobile Developer',
        imageUrl: 'assets/images/iu_pf.jpg',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "WorkO'Clock",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: BaseColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  const BaseCalendar(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 250.0,
                        child: FlutterMap(
                          options: MapOptions(
                            center: LatLng(11.5681, 104.8921), // Phnom Penh
                            zoom: 13.0,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: ['a', 'b', 'c'],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -40,
                        left: MediaQuery.of(context).size.width / 2 - 60,
                        child: ElevatedButton(
                          onPressed: controller.toggleClockInOut,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(24),
                            primary: controller.isClockedIn.value
                                ? BaseColors.secondaryColor
                                : BaseColors.primaryColor,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.timer,
                                color: Colors.white,
                                size: 32,
                              ),
                              const SizedBox(height: 8.0),
                              Obx(() => Text(
                                    controller.isClockedIn.value
                                        ? 'Clock Out'
                                        : 'Clock In',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60.0),
                  Center(
                    child: Obx(() => Text(
                          controller.elapsedTimeString,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  const SizedBox(height: 20.0),
                  _buildCard(
                    context,
                    icon: Icons.time_to_leave,
                    text: 'Request Leave',
                    color: Colors.pink.shade100,
                    onTap: () => Get.to(() => const RequestLeaveScreen()),
                  ),
                  const SizedBox(height: 10.0),
                  _buildCard(
                    context,
                    icon: Icons.work,
                    text: 'Request OT',
                    color: Colors.blue.shade100,
                    onTap: () => Get.to(() => const RequestOvertimeScreen()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
      required String text,
      required Color color,
      required VoidCallback onTap}) {
    return Card(
      elevation: 4.0,
      color: color,
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Icon(icon, color: Colors.blue),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    debugPrint("Snackbar displayed with message: $message");
  }
}
