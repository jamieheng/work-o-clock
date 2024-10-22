import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';

class BaseCalendar extends StatefulWidget {
  const BaseCalendar({super.key});

  @override
  _BaseCalendarState createState() => _BaseCalendarState();
}

class _BaseCalendarState extends State<BaseCalendar> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  bool _isWeekView = true;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  List<DateTime> _getDaysInWeek(DateTime day) {
    final startOfWeek = day.subtract(Duration(days: day.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  TableCalendar _buildCalendar() {
    return TableCalendar(
      calendarFormat: _isWeekView ? CalendarFormat.week : CalendarFormat.month,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: BaseColors.secondaryColor,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: BaseColors.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      daysOfWeekVisible: true,
      headerVisible: true,
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCalendar(),
        IconButton(
          icon: Icon(
            _isWeekView ? Icons.arrow_drop_down : Icons.arrow_drop_up,
            color: Colors.blue,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _isWeekView = !_isWeekView;
            });
          },
        ),
      ],
    );
  }
}
