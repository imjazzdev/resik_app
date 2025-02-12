import 'package:flutter/material.dart';
import 'package:resik/utils/collor_pallete.dart';
import 'package:resik/views/bantuan.dart';
import 'package:resik/views/signin.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var visible_password = false;
  var visible_confirm_password = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text('Daftar Akun'),
        backgroundColor: CollorPallete.primary,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BantuanView(),
                    ));
              },
              icon: Icon(Icons.info_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Daftar Akun',
              style: TextStyle(
                  fontSize: 30,
                  color: CollorPallete.primary,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Segera selesaikan pendaftaranmu!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'NAMA LENGKAP:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'khoerunisa alfin',
                prefixIcon: Icon(Icons.person_2_outlined),
              ),
            ),
            SizedBox(height: 20),
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
              'NOMOR TELEPON:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '632805558376',
                prefixIcon: Icon(Icons.call),
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
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Masukkan password',
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
            SizedBox(height: 20),
            Text(
              'KONFIRMASI PASSWORD:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              obscureText: visible_confirm_password,
              decoration: InputDecoration(
                  hintText: 'Konfirmasi password',
                  prefixIcon: Icon(Icons.lock_open_outlined),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          visible_confirm_password = !visible_confirm_password;
                        });
                      },
                      child: Icon(visible_confirm_password
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInView(),
                ));
          },
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
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
      ),
    );
  }
}
