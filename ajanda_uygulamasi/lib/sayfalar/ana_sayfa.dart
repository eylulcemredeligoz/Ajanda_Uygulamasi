//import 'package:ajanda_uygulamasi/sabitler/ext.dart';
import 'package:ajanda_uygulamasi/sabitler/todoitem.dart';
import 'package:ajanda_uygulamasi/sayfalar/add_new_task.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

List<String>todo=["Not","Yapılacaklar","Hedefler"];
List<String> completed=["ödevler","projeler","etkinlikler"];

class _AnaSayfaState extends State<AnaSayfa> {
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container( // kedi patisi olan yer
              width: deviceWidth,
              height: deviceHeight / 6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/8b/bb/5f/8bbb5fb4e4eb3c34e4082d0c07750b31.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 55),
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
           
            Container( //takvim ile ilgili olan yer
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
             Expanded(
               child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                 child: SingleChildScrollView(
                   child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: todo.length,
                    itemBuilder: (context,index){
                      return TodoItem(title: todo[index],);
                     },
                   )
                 ),
               ),
             ),
             Padding(
              padding: EdgeInsets.only(left: 20),
               child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tamamlandı", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 18),
                    ),
                    ),
             ),

            Expanded(
               child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                 child: SingleChildScrollView(
                   child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: completed.length,
                    itemBuilder:(context,index){
                      return TodoItem(title: completed[index]);
                    },
                    )
                 ),
               ),
             ),
             ElevatedButton(
              onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>AddNewTask(),)

              );
             }, 
             child: Text("Yeni Metin Oluştur"))
          ],
        ),
      ),
    );
  }
}
