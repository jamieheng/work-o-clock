import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:work_o_clock/src/controller/home_controller.dart';
import 'package:work_o_clock/src/screens/home/request_leave.dart';
import 'package:work_o_clock/src/screens/home/request_ot.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';
import 'package:work_o_clock/src/widgets/base_table_calender.dart';
import 'package:work_o_clock/src/widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());
  late Timer _borderAnimationTimer;
  bool _isAnimatingBorder = false;

  @override
  void initState() {
    super.initState();
    _startBorderAnimation();
  }

  @override
  void dispose() {
    _borderAnimationTimer.cancel();
    super.dispose();
  }

  void _startBorderAnimation() {
    _borderAnimationTimer =
        Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (controller.isClockedIn.value) {
        setState(() {
          _isAnimatingBorder = !_isAnimatingBorder;
        });
      } else {
        _borderAnimationTimer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          options: const MapOptions(
                            center: LatLng(11.5681, 104.8921),
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
                        left: 0,
                        right: 0,
                        child: Center(
                          // Center the button horizontally
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _isAnimatingBorder
                                    ? (controller.isClockedIn.value
                                        ? BaseColors.secondaryColor
                                        : Colors.transparent)
                                    : Colors.transparent,
                                width: 5,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.toggleClockInOut();
                                if (controller.isClockedIn.value) {
                                  _startBorderAnimation(); // Start animation on clock in
                                } else {
                                  _borderAnimationTimer
                                      .cancel(); // Stop animation on clock out
                                  setState(() {
                                    _isAnimatingBorder =
                                        false; // Reset animation state
                                  });
                                }
                              },
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
