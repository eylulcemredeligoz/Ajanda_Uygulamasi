import 'package:ajanda_uygulamasi/constants/tasktype.dart';
import 'package:ajanda_uygulamasi/model/task.dart';
import 'package:flutter/material.dart';
import 'package:ajanda_uygulamasi/sabitler/ext.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key,required this.task});
   final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Card(

                       color: renk('f9d2e5'),
                       
                        //color: renk('a38e9b'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),//cartın köşelerini yumuşatır
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              widget.task.type==Tasktype.akademikHayat
                              ? Image(image: NetworkImage('https://i.pinimg.com/736x/4a/9d/7c/4a9d7c207cda72505eff27d19b2089b8.jpg'),height: 50,) //yuvarlak ıconlalr buraya gelicek
                              : widget.task.type == Tasktype.ozelHayat
                               ?Image(image: NetworkImage('https://i.pinimg.com/736x/b5/e7/be/b5e7be1f91003967178f208e718c03c1.jpg'),height: 50,)
                               :Image(image: NetworkImage('https://i.pinimg.com/736x/58/e9/a5/58e9a53286fd14cdb7a2150f35718959.jpg'),height: 50,),

                              
                              
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                 widget.task.title, 
                                  style: TextStyle(
                                    decoration:widget.task.isCompleted?  TextDecoration.lineThrough:TextDecoration.none,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,color:renk('da7390')),
                                    ),
                                    Text(widget.task.description,
                                    style: TextStyle(
                                      decoration: widget.task.isCompleted?  TextDecoration.lineThrough:TextDecoration.none,
                                      color: renk('e591a8'),
                                      fontWeight: FontWeight.bold,
                                    ),)
                                
                                  ],
                                ),
                              ),
                              
                              
                              Checkbox(value: isChecked, onChanged: (val)=> {
                                setState(() {
                                  widget.task.isCompleted=!widget.task.isCompleted;
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