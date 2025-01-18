import 'package:ajanda_uygulamasi/constants/tasktype.dart';

class Task {
  final int? id; // id alanı nullable olarak eklendi
  final Tasktype type;
  final String title;
  final String description;
  bool isCompleted;
  final String? date;
  final String? time;

  Task({
    this.id, // Yeni oluşturulan görevlerde id null olabilir
    required this.type,
    required this.title,
    required this.description,
    required this.isCompleted,
    this.date,
    this.time,
  });

  void setIsCompleted(bool value) {
    isCompleted = value;
  }

  // Veritabanına yazmak için Map'e dönüştürme
  Map<String, dynamic> toMap() {
    return {
      'id': id, // id'yi de ekledik
      'title': title,
      'description': description,
      'type': type.toString(),
      'isCompleted': isCompleted ? 1 : 0,
      'date': date,
      'time': time,
    };
  }

  // Veritabanından okuma işlemi için Map'ten Task'e dönüştürme
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'], // id değerini map'ten alıyoruz
      type: Tasktype.values.firstWhere((e) => e.toString() == map['type']),
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
      date: map['date'],
      time: map['time'],
    );
  }
}
