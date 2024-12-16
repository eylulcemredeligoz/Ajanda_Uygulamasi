import 'package:ajanda_uygulamasi/sabitler/ext.dart';
import 'package:flutter/material.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context) {
     double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight/10,
                color:renk('f2b3c3'),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    },
                     icon: Icon(
                      Icons.close_rounded,
                      size: 30,
                      color: renk('da7390'),
                      ),
                      ),
                      Expanded(child: Text(
                        "Yeni Metin Oluştur",
                        style: TextStyle(
                          color:renk('da7390'),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                        ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("Başlık"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("Kategori"),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text("Akademik Hayat Seçildi"))
                      );
                    },
                    child: Image(image: NetworkImage('https://i.pinimg.com/736x/4a/9d/7c/4a9d7c207cda72505eff27d19b2089b8.jpg'),
                    height: 70,
                    width: 70,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text("Sosyal Hayat Seçildi"))
                      );
                    },
                    child: Image(image: NetworkImage('https://i.pinimg.com/736x/58/e9/a5/58e9a53286fd14cdb7a2150f35718959.jpg'),
                    height: 70,
                    width: 70,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text("Özel Hayat Seçildi"))
                      );
                    },
                    child: Image(image: NetworkImage('https://i.pinimg.com/736x/b5/e7/be/b5e7be1f91003967178f208e718c03c1.jpg'),
                    height: 70,
                    width: 70,
                    ),
                  )
                  
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("Tarih"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("Saat"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("Notlar"),
              ),
              SizedBox(
                height: 300,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Kaydet"))
            ],
          ),
        )
      ),
    );
  }
}