import 'package:flutter/material.dart';
import 'package:resik/utils/collor_pallete.dart';
import 'package:resik/views/signin.dart';
import 'package:resik/views/signup.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            Image.asset(
              'assets/vector-1.png', // Pastikan Anda memiliki gambar ini di folder assets
              // width: 100,
              // height: 100,
            ),
            SizedBox(height: 60),
            Text(
              'Selamat datang di Resik!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Aplikasi yang membantu permasalahan sampah anda',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 200,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpView(),
                    ));
              },
              child: Container(
                margin: EdgeInsets.all(7),
                height: 60,
                width: 230,
                alignment: Alignment.center,
                child: Text(
                  'DAFTAR',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CollorPallete.primary),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInView(),
                    ));
              },
              child: Container(
                margin: EdgeInsets.all(7),
                height: 60,
                width: 230,
                alignment: Alignment.center,
                child: Text(
                  'MASUK',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CollorPallete.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
