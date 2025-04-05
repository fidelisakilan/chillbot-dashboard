import 'package:flutter/material.dart';
import 'package:mesh/mesh.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final middle = 0.33;
    return Opacity(
      opacity: 0.7,
      child: AnimatedOMeshGradient(
        curve: Curves.easeInOut,
        tessellation: 14,
        duration: const Duration(seconds: 1),
        mesh: OMeshRect(
          width: 3,
          height: 4,
          colorSpace: OMeshColorSpace.linear,
          vertices: [
            (0.0, 0.0).v, (0.5, 0.0).v, (1.0, 0.0).v, //

            (0.0, 0.33).v,
            (middle, middle).v.bezier(
              east: (middle + (0.9 - middle), middle).v,
              west: (middle - (middle - 0.1), middle).v,
            ),
            (1.0, 0.33).v, //

            (0.0, 0.66).v,
            (middle, 0.66).v.bezier(),
            (1.0, 0.66).v, //

            (0.0, 1.0).v, (0.5, 1.0).v, (1.0, 1.0).v, //
          ],
          colors: const [
            Colors.red, Colors.green, Colors.blue, //
            Colors.yellow, Colors.purple, Colors.orange, //
            Colors.teal, Colors.green, Colors.pink, //
            Colors.cyan, Colors.pinkAccent, Colors.amber, //
          ],
        ),
      ),
    );
  }
}
