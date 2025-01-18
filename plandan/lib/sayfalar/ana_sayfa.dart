import 'package:ajanda_uygulamasi/model/task.dart';
import 'package:ajanda_uygulamasi/sabitler/ext.dart';
import 'package:ajanda_uygulamasi/sabitler/todoitem.dart';
import 'package:ajanda_uygulamasi/database_helper.dart';
import 'package:ajanda_uygulamasi/sayfalar/add_new_task.dart';
import 'package:ajanda_uygulamasi/sayfalar/oturum/giris.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  bool isChecked = false;
  List<Task> todo = [];
  List<Task> completed = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    List<Task> tasks = await DatabaseHelper().getTasks();
    setState(() {
      todo = tasks.where((task) => !task.isCompleted).toList();
      completed = tasks.where((task) => task.isCompleted).toList();
    });
  }

  void addNewTask(Task newTask) async {
    await DatabaseHelper().insertTask(newTask);
    _loadTasks(); // Veritabanından güncel görevleri yeniden yükle
  }

  void deleteTask(int taskId) async {
    await DatabaseHelper().deleteTask(taskId); // Veritabanından silme işlemi
    _loadTasks(); // Silme işlemi sonrası görevleri güncelle
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: _getBodyContent(_currentIndex, deviceHeight, deviceWidth),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 70, // Yükseklik artırıldı
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavButton(Icons.home, "Anasayfa", 0),
                _buildNavButton(Icons.edit, "Plan Ekle", 2),
                _buildNavButton(Icons.logout, "Çıkış Yap", 1),
              ],
            ),
          ),
          color: renk("f2b3c3"),
          elevation: 5.0,
        ),
      ),
    );
  }

  Widget _buildNavButton(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 2) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddNewTask(
              addNewTask: (newTask) => addNewTask(newTask),
            ),
          ));
        } else if (index == 1) {
          _showLogoutConfirmationDialog(); // Çıkış için alert dialog çağrılır
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min, // İçeriği sınırlamak için
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _currentIndex == index ? renk("da7390") : Colors.white,
            size: 30, // Simge boyutunu optimize ettik
          ),
          SizedBox(height: 4.0), // Simge ile metin arasına boşluk ekledik
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0, // Yazı boyutunu küçülttük
              color: _currentIndex == index ? renk("da7390") : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBodyContent(int index, double deviceHeight, double deviceWidth) {
    switch (index) {
      case 0:
        return Column(
          children: [
            Container(
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
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) {
                return false;
              },
              onDaySelected: (selectedDay, focusedDay) {},
              onFormatChanged: (format) {},
              onPageChanged: (focusedDay) {},
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: ListView.builder(
                  itemCount: todo.length,
                  itemBuilder: (context, index) {
                    final task = todo[index];
                    return Dismissible(
                      key: Key(task.id?.toString() ?? index.toString()),
                      onDismissed: (direction) {
                        if (task.id != null) {
                          deleteTask(task.id!);
                        }
                      },
                      background: Container(
                        color: Colors.red, // Kırmızı arka plan
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.delete, color: Colors.white), // Çöp kutusu ikonu
                      ),
                      direction: DismissDirection.startToEnd, // Sola kaydırma
                      child: TodoItem(
                        task: task,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      case 1:
        return Center(child: Text("Görevler Ekranı"));
      case 2:
        return Center(child: Text("Ekleme Ekranı"));
      default:
        return Center(child: Text("Ana Sayfa Ekranı"));
    }
  }

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Çıkış Yap",style: TextStyle(color: renk("a38e9b"))),
          content: Text("Çıkış yapmak istediğinizden emin misiniz?",style: TextStyle(color: renk("a38e9b"))),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapatır
              },
              child: Text("Hayır", style: TextStyle(color: renk("da7390")),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapatır
                _navigateToLoginPage(); // Giriş sayfasına yönlendirir
              },
              child: Text("Evet",style: TextStyle(color: renk("da7390"))),
            ),
          ],
        );
      },
    );
  }

  void _navigateToLoginPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => GirisSayfasi(), // LoginPage'i burada tanımlamalısınız
      ),
    );
  }
}
