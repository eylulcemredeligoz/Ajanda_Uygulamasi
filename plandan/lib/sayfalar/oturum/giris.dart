import 'package:ajanda_uygulamasi/sabitler/ext.dart';
import 'package:ajanda_uygulamasi/sayfalar/ana_sayfa.dart';
import 'package:ajanda_uygulamasi/sayfalar/oturum/kayit.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  bool sifre_gozukme = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _girisYap() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == 'admin' && password == 'admin') {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AnaSayfa(),
      ));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Hata",style: TextStyle(color: renk("a38e9b"))),
            content: Text("E-Posta veya Şifre hatalı!",style: TextStyle(color: renk("a38e9b"))),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Tamam",style: TextStyle(color: renk("da7390")),),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: renk(arka_renk),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 180,
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: const Color.fromARGB(255, 241, 45, 94)
                          .withOpacity(0.2),
                      width: 3,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: renk(arka_renk),
                        width: 15,
                      ),
                    ),
                    child: Image(
                      image: NetworkImage(
                          'https://i.pinimg.com/originals/80/7b/5c/807b5c4b02e765bb4930b7c66662ef4b.gif'),
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "PLANDAN",
                    style: TextStyle(color: renk("a38e9b"), fontSize: 30),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: renk("da7390"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin:
                      EdgeInsets.only(top: 30, bottom: 10, right: 30, left: 30),
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "E-Posta Adresinizi Girin",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(
                        Icons.people_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: renk("da7390"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin:
                      EdgeInsets.only(top: 5, bottom: 30, right: 30, left: 30),
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !sifre_gozukme,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Şifrenizi Girin",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: Colors.white,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            sifre_gozukme = !sifre_gozukme;
                          });
                        },
                        icon: Icon(
                          sifre_gozukme
                              ? Icons.remove_red_eye_outlined
                              : Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: _girisYap,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              renk("da7390"),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: renk("da7390"),
                              offset: Offset(0, 4),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Giriş Yap",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => KayitSayfasi(),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 4),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Kayıt Ol",
                                  style: TextStyle(
                                    color: renk("da7390"),
                                    fontSize: 17,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 70,
                                  color: renk("da7390"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
