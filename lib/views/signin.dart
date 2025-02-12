import 'package:flutter/material.dart';
import 'package:resik/views/bottom_nav/home.dart';
import 'package:resik/widgets/main_navigator.dart';

import '../utils/collor_pallete.dart';

class SignInView extends StatefulWidget {
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  var visible_password = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text('Masuk Akun'),
        backgroundColor: CollorPallete.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Masuk Akun',
              style: TextStyle(
                  fontSize: 30,
                  color: CollorPallete.primary,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Silahkan isi data dibawah ini untuk melanjutkan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 130),
            Text(
              'EMAIL:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'khoerunisaalfin@gmail.com',
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'PASSWORD:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              obscureText: visible_password,
              decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock_open_outlined),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          visible_password = !visible_password;
                        });
                      },
                      child: Icon(visible_password
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined))),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MainNavigator(),
                ),
                (Route route) => false);
          },
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
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
      ),
    );
  }
}
