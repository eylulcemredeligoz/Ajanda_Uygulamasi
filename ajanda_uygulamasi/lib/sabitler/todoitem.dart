import 'package:flutter/material.dart';
import 'package:ajanda_uygulamasi/sabitler/ext.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key,required this.title});
   final String title;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Card(
                        color: renk('f9d2e5'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),//cartın köşelerini yumuşatır
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.note_alt_outlined, size: 40,color: renk('da7390'),),
                              Text(
                               widget.title, 
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,color:renk('da7390')),),
                              
                              Checkbox(value: isChecked, onChanged: (val)=> {
                                setState(() {
                                  isChecked=val!;//eğer sadece val değişkeni varsa işleme sok (checkboxun çalışıp çalışmaması)
                                })
                              },
                              //checkColor: renk('da7390'),
                              activeColor: renk('da7390'),
                              )
                            ],
                          ),
                        ),
                      );
  }
}