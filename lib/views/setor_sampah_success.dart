import 'package:flutter/material.dart';
import 'package:resik/views/reward.dart';

import '../utils/collor_pallete.dart';

class SetorSampahSuccess extends StatelessWidget {
  const SetorSampahSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/success.png'),
            SizedBox(
              height: 30,
            ),
            Text(
              'Setor Sampah Berhasil!',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Silakan lanjut ke halaman Reward untuk klaim poin Anda.',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ClaimRewardView(),
                ));
          },
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 70),
            height: 60,
            width: 230,
            alignment: Alignment.center,
            child: Text(
              'Lanjutkan',
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
