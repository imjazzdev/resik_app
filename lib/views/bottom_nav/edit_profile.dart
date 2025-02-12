import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // Header Profil
            Container(
              height: 200,
              width: double.maxFinite,
              color: Colors.teal.shade100,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 56,
                        backgroundColor: Colors.teal,
                      ),
                      const CircleAvatar(
                        radius: 50,

                        backgroundImage: AssetImage(
                            "assets/profile.png"), // Ganti dengan path gambar Anda
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Khoerunisa Alfin",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Form Input
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.teal.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel("USERNAME :"),
                  _buildTextField(Icons.person, "khoerunisa alfin"),
                  _buildLabel("EMAIL :"),
                  _buildTextField(Icons.email, "khoerunisaalfin@gmail.com"),
                  _buildLabel("NOMOR TELEPON :"),
                  _buildTextField(Icons.phone, "+63-280-555-8376"),
                  _buildLabel("Birth Date"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDateBox("06"),
                      _buildDateBox("Juni"),
                      _buildDateBox("2003"),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "Bergabung 7 Januari 2025",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Label
  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Text(
        label,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
      ),
    );
  }

  // Widget TextField
  Widget _buildTextField(IconData icon, String text) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: text,
        border: const UnderlineInputBorder(),
      ),
    );
  }

  // Widget Kotak Tanggal Lahir
  Widget _buildDateBox(String text) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        border: Border(bottom: BorderSide(color: Colors.grey)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
