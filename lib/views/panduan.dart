import 'package:flutter/material.dart';

class PanduanView extends StatelessWidget {
  const PanduanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Panduan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildGuideCard(
              "Pilih Jenis Sampah",
              [
                "Siapkan jenis sampah yang akan di scan",
                "Tentukan berat sampah",
                "Pilih setor sampah",
              ],
            ),
            _buildGuideCard(
              "Menambahkan gambar sampah",
              [
                "Siapkan gambar dari galeri",
                "Masukan maksimal 3 gambar",
              ],
            ),
            _buildGuideCard(
              "Masukan Informasi",
              [
                "Isi data informasi yang tersedia",
                "Konfirmasi alamat penjemputan sampah",
              ],
            ),
            _buildGuideCard(
              "Pilih Metode Reward",
              [
                "Pilih metode reward yang tersedia",
                "Reward diberikan secara non-tunai",
                "Pastikan menerima pesan informasi setelah menerima reward",
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan kartu panduan
  Widget _buildGuideCard(String title, List<String> items) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.teal)),
      // elevation: 2,

      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: items
                  .map(
                    (item) => ListTile(
                      leading: const Icon(Icons.radio_button_unchecked,
                          color: Colors.teal),
                      title: Text(item, style: const TextStyle(fontSize: 14)),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
