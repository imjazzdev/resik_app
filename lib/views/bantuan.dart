import 'package:flutter/material.dart';
import 'package:resik/utils/collor_pallete.dart';

class BantuanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bantuan'),
        backgroundColor: CollorPallete.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Cara daftar akun Resik:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '1.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Isi data pada halaman pendaftaran',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '2.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Klik tombol daftar',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '3.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Akun Resik berhasil didaftarkan',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '4.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Mulai setor sampahmu',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
