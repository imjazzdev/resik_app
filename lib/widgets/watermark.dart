import 'package:flutter/material.dart';

class WatermarkWrapper extends StatelessWidget {
  final Widget child;
  const WatermarkWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child, // Tampilan utama
        Positioned.fill(
          child: IgnorePointer(
            child: Center(
              child: Opacity(
                opacity: 0.6, // Sesuaikan transparansi
                child: Text(
                  "DEMO VERSION\n @JAZZDEV",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
