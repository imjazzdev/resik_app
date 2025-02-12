import 'package:flutter/material.dart';

class PesananView extends StatefulWidget {
  const PesananView({super.key});

  @override
  _PesananViewState createState() => _PesananViewState();
}

class _PesananViewState extends State<PesananView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text(
          'Pesanan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.teal,
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black54,
              tabs: const [
                Tab(text: "Sedang Berlangsung"),
                Tab(text: "Selesai"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent("assets/vector-3.png",
                    "Ayo lakukan perubahan bersama Resik!"),
                _buildTabContent("assets/vector-3.png",
                    "Ayo mulai setor sampahmu sekarang!"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String imagePath, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 200, height: 200),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
