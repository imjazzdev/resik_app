import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resik/views/setor_sampah_success.dart';
import '../widgets/scanner_widget.dart';

class PindaiView extends StatefulWidget {
  const PindaiView({super.key});

  @override
  State<PindaiView> createState() => _PindaiViewState();
}

class _PindaiViewState extends State<PindaiView>
    with SingleTickerProviderStateMixin {
  int total = 0;

  late AnimationController _animationController;
  bool _animationStopped = false;

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String scannedResult = "";

  String? selectedTrash;
  final List<String> typeTrash = [
    "Alumunium",
    "Botol kaca",
    "Galon",
    'Tutup botol',
    'Koran',
    'Kardus',
    'Kertas',
    'Plastik keemasan'
  ];

  Future<void> scanFromGallery() async {
    try {
      // Ambil gambar dari galeri
      image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {});
        _animationController = AnimationController(
          duration: Duration(seconds: 5),
          vsync: this,
        );

        animateScanAnimation(false);

        // Jalankan animasi selama 3 detik dan tampilkan popup setelahnya
        Future.delayed(const Duration(seconds: 4), () {
          setState(() {
            total = 8500;
          });
        });
      }
    } catch (e) {
      setState(() {
        scannedResult = "Failed to scan: $e";
      });
    }
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pindai Sampah",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Pindai Sampah
            const Text("Pindai sampah :",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            image != null
                ? Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                          ),
                        )),
                      ),
                      ScannerAnimation(
                        _animationStopped,
                        334,
                        animation: _animationController,
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: scanFromGallery,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Icon(Icons.camera_alt,
                              size: 50, color: Colors.grey)),
                    ),
                  ),
            const SizedBox(height: 16),

            // Hasil Pindai
            const Text("Hasil Pindai :",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text("Hasil deteksi sampah akan muncul di sini")),
            ),
            const SizedBox(height: 16),

            // Input Nama
            _buildLabel("Nama :"),
            _buildTextField(),
            _buildLabel("Alamat :"),
            _buildTextField(),
            _buildLabel("Tanggal :"),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('in development')));
                      },
                      child: Icon(Icons.date_range_rounded))
                ],
              ),
            ),
            _buildLabel("Catatan :"),
            _buildTextField(),
            SizedBox(
              height: 17,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Jenis Sampah :',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                        flex: 1,
                        child: Text(
                          'Berat :',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                        flex: 1,
                        child: Text(
                          'Harga :',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildDropdown(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildTextField(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildTextField(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildDropdown(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildTextField(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildTextField(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildDropdown(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildTextField(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildTextField(),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'BUANG RIWAYAT',
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Total Estimasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total :",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Rp. $total",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // Tombol Setor Sampah
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetorSampahSuccess(),
                      ));
                  setState(() {
                    image = null;
                    total = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text("SETOR SAMPAH",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 5),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Widget TextField
  Widget _buildTextField(
      {bool readOnly = false, String text = "", bool bold = false}) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style:
            TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      height: 47,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedTrash,
          hint: const Text(
            "Pilih Jenis Sampah",
            style: TextStyle(fontSize: 13),
          ),
          items: typeTrash.map((method) {
            return DropdownMenuItem(
              value: method,
              child: Text(method),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedTrash = value;
            });
          },
        ),
      ),
    );
  }
}
