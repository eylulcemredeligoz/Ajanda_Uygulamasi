import 'package:ajanda_uygulamasi/sabitler/ext.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea( //uygulamanın ekranlarda taşmasını engeller
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           decoration: BoxDecoration( 
            color:renk(arka_renk), 
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(//gifin old bölüm
                    width: 180,
                    height: 180,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: const Color(0xFFF2B3C3).withOpacity(0.2),
                        width: 1,
                        ),
                    ),
                    child:Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: renk(arka_renk),
                          width: 15,
                        ),
                        ),
                      child:Image(
                        image: NetworkImage('https://i.pinimg.com/originals/80/7b/5c/807b5c4b02e765bb4930b7c66662ef4b.gif'),
                        width: 45,
                        height: 45,
                        ) ,
                    ),
                    ),
                  Container(//uygulama adının yazdığı bölüm
                margin: EdgeInsets.only(top: 20),
                 child: Text(
                  "Uygulama Adı",
                 style:TextStyle(
                  color: Colors.white,
                  fontSize:30 
                  //fontFamily: fon ailesini yazabiliriz.(login sayfası videosu 34.dkka)
                  ),
                  ),
               ),
                  Container(//birinci yazı yazma kutusu
                    decoration: BoxDecoration(
                      color: renk("da7390"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin:EdgeInsets.only(top: 30,bottom: 10, right: 30,left: 30) ,
                    padding: EdgeInsets.only(left: 15,right: 15,top:5, bottom: 5),
                    child: TextFormField( //boş bir metin yazma alanı getirir
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "E-Posta Adresinizi Girin",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(
                        Icons.people_alt_outlined,
                        color: Colors.white, //iconun rengi
                        ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                  Container(//ikinci yazı yazma kutusu
                    decoration: BoxDecoration(
                      color: renk("da7390"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(top: 5,bottom: 30, right: 30,left: 30) ,
                    padding: EdgeInsets.only(left: 15,right: 15,top:5, bottom: 5),
                    child: TextFormField( //boş bir metin yazma alanı getirir
                     obscureText: true,//şifreyi yazarken görünmemesini sağlar
                     decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Şifrenizi Girin",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        //letterSpacing: 5,//yazdığımız rakamlar arasındaki mesafeyi ayarlar
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.white, //iconun rengi
                        ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                  InkWell(// yaptığımız widgete tıklanabilirlik özelliği sağlar.
                  onTap: (){
                    print("tıklandı");
                  },
                    child: Container(
                       //margin: EdgeInsets.symmetric(horizontal:50 ) ,
                      width:MediaQuery.of(context).size.width / 1.5 , //butonun büyüklüğünü ekranın boyutuna göre ayarlar
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [ //buyona geçişli renk verir
                          Colors.white,
                          Colors.pink,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow( //butondaki gölgenin ayarı
                            color: Colors.pink,
                            offset: Offset(0, 4),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(color: Colors.white,
                          fontSize: 20,
                          ),
                          ),
                      ),
                    ),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}