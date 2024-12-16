import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight / 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/8b/bb/5f/8bbb5fb4e4eb3c34e4082d0c07750b31.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text(
                    "PLANDAN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) {
                      return false; // Seçilen gün mantığı için bir kontrol eklenebilir.
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      // Gün seçildiğinde çalışacak işlemler.
                    },
                    onFormatChanged: (format) {
                      // Takvim formatı değiştiğinde çalışacak işlemler.
                    },
                    onPageChanged: (focusedDay) {
                      // Sayfa değiştiğinde çalışacak işlemler.
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
