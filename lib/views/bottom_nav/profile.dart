import 'package:flutter/material.dart';
import 'package:resik/utils/collor_pallete.dart';
import 'package:resik/views/bottom_nav/edit_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CollorPallete.primary,
        centerTitle: true,
        title: Text('Profile'),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 20),
          // Bagian Header Profil
          Container(
            height: 138,
            width: double.maxFinite,
            margin: EdgeInsets.all(20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: CollorPallete.primary,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      "assets/profile.png"), // Ganti dengan path gambar Anda
                ),
                const SizedBox(height: 10),
                const Text(
                  "Khoerunisa Alfin",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileView(),
                    ));
              },
              icon: const Icon(Icons.edit, size: 18),
              label: const Text("Edit Profil"),
            ),
          ),
          const SizedBox(height: 10),

          // Daftar Menu Profil
          Expanded(
            child: ListView(
              children: [
                _buildSectionTitle("Tentang"),
                _buildMenuItem(Icons.info, "Panduan"),
                _buildMenuItem(Icons.description, "Syarat dan Ketentuan"),
                _buildMenuItem(Icons.privacy_tip, "Kebijakan Privasi"),
                _buildMenuItem(Icons.help, "Pertanyaan Umum"),
                _buildSectionTitle("Lainnya"),
                _buildMenuItem(Icons.verified, "Versi Aplikasi"),
                _buildMenuItem(Icons.logout, "Keluar", iconColor: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Judul Section
  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      color: Colors.grey.shade300,
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  // Widget Item Menu
  Widget _buildMenuItem(IconData icon, String title,
      {Color iconColor = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
