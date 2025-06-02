import 'package:flutter/material.dart';
import 'package:seu_projeto/models/feitico.dart'; // Assuming 'seu_projeto' is the project name from imports

class FeiticoCard extends StatelessWidget {
  final Feitico feitico;

  const FeiticoCard({super.key, required this.feitico});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feitico.nome,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Text(feitico.descricao),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Chip(
                label: Text(
                  'Elemento: ${feitico.elemento}',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.deepPurple.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
