import 'package:flutter/material.dart';

class ClaimRewardView extends StatefulWidget {
  const ClaimRewardView({super.key});

  @override
  State<ClaimRewardView> createState() => _ClaimRewardViewState();
}

class _ClaimRewardViewState extends State<ClaimRewardView> {
  String? selectedMethod;
  final List<String> claimMethods = ["Bank BNI, Bank BCA, Bank BRI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reward",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Saldo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    "Rp. 9.999",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatusBox("12", "Berhasil"),
                      _buildStatusBox("12", "Proses"),
                      _buildStatusBox("12", "Menunggu"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Form Input
            _buildLabel("Nama :"),
            _buildTextField(),

            _buildLabel("Nomor Telepon :"),
            _buildTextField(),

            _buildLabel("Saldo :"),
            _buildTextField(readOnly: true, text: "Rp. 9.999", bold: true),

            _buildLabel("Metode :"),
            _buildDropdown(),

            _buildLabel("Nomor Rekening :"),
            _buildTextField(),
          ],
        ),
      ),
    );
  }

  // Widget Status Box
  Widget _buildStatusBox(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  // Widget Label
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

  // Widget Dropdown
  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedMethod,
          hint: const Text("Pilih Metode Klaim Reward"),
          items: claimMethods.map((method) {
            return DropdownMenuItem(
              value: method,
              child: Text(method),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedMethod = value;
            });
          },
        ),
      ),
    );
  }
}
