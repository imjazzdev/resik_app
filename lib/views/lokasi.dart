import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LokasiView extends StatelessWidget {
  const LokasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lokasi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          // Peta dengan rute
          FlutterMap(
            options: MapOptions(
              center: const LatLng(-6.9732, 107.6305), // Lokasi awal (contoh)
              zoom: 16.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      const LatLng(-6.9707, 107.6280), // Titik awal (contoh)
                      const LatLng(-6.9750, 107.6350), // Titik tujuan (contoh)
                    ],
                    strokeWidth: 5.0,
                    color: Colors.blue,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: const LatLng(-6.9707, 107.6280),
                    width: 40,
                    height: 40,
                    child:
                        Icon(Icons.location_pin, color: Colors.red, size: 40),
                  ),
                  Marker(
                    point: const LatLng(-6.9750, 107.6350),
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.location_on,
                        color: Colors.teal, size: 40),
                  ),
                ],
              ),
            ],
          ),
          // Panel Informasi
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildLocationPanel(),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationPanel() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.teal),
              SizedBox(width: 8),
              Text("Lokasi Anda",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade500)),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Icon(Icons.location_city, color: Colors.orange),
              SizedBox(width: 8),
              Text("Bank Sampah Bersinar",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade500)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.teal)),
                      child: Image.asset('assets/direction.png')),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.teal)),
                    child: IconButton(
                      icon:
                          const Icon(Icons.share, color: Colors.teal, size: 30),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
