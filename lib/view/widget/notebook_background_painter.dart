import 'package:flutter/material.dart';

class NotebookBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFF5E9D3); // Color amarillento del papel

    // Fondo amarillento
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Dibujar líneas del cuaderno
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue[300]!
      ..strokeWidth = 1.0;

    const double lineSpacing = 20; // Espaciado entre líneas
    for (double y = lineSpacing; y < size.height; y += lineSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // Línea roja al inicio (margen)
    final marginPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red[300]!
      ..strokeWidth = 2.0;

    canvas.drawLine(
      Offset(size.width * 0.1, 0), // Línea roja al 10% del ancho
      Offset(size.width * 0.1, size.height),
      marginPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class NotebookPage extends StatelessWidget {
  final Widget child;

  const NotebookPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NotebookBackgroundPainter(),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyNotebookPage()));
}

class MyNotebookPage extends StatelessWidget {
  const MyNotebookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cuaderno')),
      body: NotebookPage(
        child: const Text(
          'Este es un texto en un cuaderno.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}