import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resik/utils/collor_pallete.dart';
import 'package:resik/utils/var_global.dart';
import 'package:resik/views/bantuan.dart';
import 'package:resik/views/bottom_nav/notifikasi.dart';
import 'package:resik/views/lokasi.dart';
import 'package:resik/views/panduan.dart';
import 'package:resik/views/pindai.dart';
import 'package:resik/views/reward.dart';
import 'package:resik/views/riwayat.dart';
import 'package:resik/views/setor_sampah.dart';
import 'package:resik/widgets/watermark.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
              radius: 24,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Selamat Datang!',
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
                Text(
                  '[ User ]',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 13),
                ),
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotifikasiView(),
                  ));
            },
            child: Icon(
              Icons.notifications_none_rounded,
              color: Colors.teal,
              size: 30,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Header User

              const SizedBox(height: 20),

              // Card Sampah Terkumpul
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Sampah Terkumpul',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset('assets/badge.png')
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RiwayatView(),
                            ));
                      },
                      child: Text(
                        'Riwayat >',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Jadwal Sampah
              Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Mari siapkan dan jadwalkan sampahmu!',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                    Image.asset(
                      'assets/vector-2.png',
                      // width: 50,
                      height: 80,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Grid Menu
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: (1 / .6),
                children: [
                  _buildMenuItem(
                      context, Icons.delete, 'Setor Sampah', PindaiView()),
                  _buildMenuItem(
                      context, Icons.location_on, 'Lokasi', LokasiView()),
                  _buildMenuItem(context, Icons.card_giftcard, 'Reward',
                      ClaimRewardView()),
                  _buildMenuItem(
                      context, Icons.help_outline, 'Bantuan', BantuanView()),
                ],
              ),

              const SizedBox(height: 20),

              // Informasi edukasi
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hai! Siap untuk belajar cara mengubah sampah menjadi poin? Mari kita baca panduannya!',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PanduanView(),
                            ));
                      },
                      child: Text(
                        'Panduan',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade300),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Informasi Terkini
              Text(
                'Informasi Terkini',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: CollorPallete.primary),
              ),
              const SizedBox(height: 10),
              Container(
                height: 120,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    disableCenter: false,
                    pauseAutoPlayInFiniteScroll: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.95,
                  ),
                  items: [
                    Container(
                        // margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/slide-1.png',
                            fit: BoxFit.contain,
                            // width: MediaQuery.of(context).size.width * 0.95,
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/slide-2.png',
                            fit: BoxFit.contain,
                            // width: MediaQuery.of(context).size.width * 0.95,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, IconData icon, String title, Widget route) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ));
      },
      child: Container(
        height: 100,
        padding: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.teal.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 40, color: Colors.white),
                Icon(Icons.more_horiz_rounded, size: 30, color: Colors.white),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CollorPallete.primary)),
            ),
          ],
        ),
      ),
    );
  }
}
